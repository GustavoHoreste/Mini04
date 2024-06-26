//
//  CameraModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import Foundation
import CoreImage
import AVFoundation
import SwiftUI

class CameraModel: NSObject, ObservableObject {
    
    //Armazena o frame atual da camera
    @Published var frame:UIImage!
    
    //Armazena os ultimos 8 frames
    var lastFrames:[UIImage] = []
    
    //Sessão de captura e fila da câmera
    var captureSession = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: "sessionQueue")
    
    //devices da camera
    var backCamera: AVCaptureDevice!
    var frontCamera: AVCaptureDevice!
    
    //Inputs da camera
    var backCameraInput: AVCaptureInput!
    var frontCameraInput: AVCaptureInput!
    
    //Output da imagem
    var videoOutput: AVCaptureVideoDataOutput = AVCaptureVideoDataOutput()
    
    //Verifica se o usuario permitio o uso da camera
    var permission:Bool = true
    
    //Contexto para converter a imagem
    var context:CIContext = CIContext()
    
    //Verifica qual camera esta sendo usada
    var backCameraOn:Bool = true
    
    var delegate: AVCaptureVideoDataOutputSampleBufferDelegate!
    
    //MARK: - Inicializadores
    //Init para swiftUI
    override init() {
        super.init()
        self.setupAndStartSession()
    }
    
    //Init para UIkit
    convenience init(delegate: AVCaptureVideoDataOutputSampleBufferDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    //MARK: - Camera session setup
    private func setupAndStartSession() {
        self.checkPermission()
        sessionQueue.async { [unowned self] in
            DispatchQueue.global(qos: .userInitiated).async {
                
                self.captureSession = AVCaptureSession()
                
                self.captureSession.beginConfiguration()
                
                if self.captureSession.canSetSessionPreset(.photo) {
                    self.captureSession.sessionPreset = .photo
                }
                
                self.captureSession.automaticallyConfiguresApplicationAudioSession = true
                
                self.setupInputs()
                
                self.setupOutputs()
                
                self.captureSession.commitConfiguration()
                
                self.captureSession.startRunning()
            }
            
            self.captureSession.startRunning()
        }
    }
    
    //Configura o output da camera
    private func setupOutputs() {
        videoOutput = AVCaptureVideoDataOutput()
        let videoQueue = DispatchQueue(label: "videoQueue", qos: .userInitiated)
        
        if let delegate = self.delegate {
            videoOutput.setSampleBufferDelegate(delegate, queue: videoQueue)
        } else {
            videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
        }
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        } else {
            fatalError("Could not add output")
        }
        
        videoOutput.connections.first?.videoRotationAngle = 90
        
//        videoOutput.connections.first?.isVideoMirrored = true
    }
    
    private func setupInputs() {
        //Back camera setup
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            self.backCamera = device
        } else {
            fatalError("Back camera not found")
        }
        
        //Front camera setup
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            self.frontCamera = device
        } else {
            fatalError("Front camera not found")
        }
        
        //Input config for each device
        guard let bInput = try? AVCaptureDeviceInput(device: backCamera) else {
            fatalError("Could not create back camera input")
        }
        self.backCameraInput = bInput
        if !captureSession.canAddInput(backCameraInput) {
            fatalError("Could not add back camera input")
        }
        
        guard let fInput = try? AVCaptureDeviceInput(device: frontCamera) else {
            fatalError("Could not create front camera input")
        }
        self.frontCameraInput = fInput
        if !captureSession.canAddInput(frontCameraInput) {
            fatalError("Could not add front camera input")
        }
        
        //Adiciona o input inicial da capture session
        captureSession.addInput(backCameraInput)
    }
    
    //MARK: - CAmera Permission
    //Verifica o acesso a camera do dispositivo
    private func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            self.permission = true
            
        case .notDetermined:
            self.requestPermission()
        default:
            self.permission = false
        }
    }
    
    //Pede acesso a camera do dispositivo
    private func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] permission in
            self.permission = permission
        }
    }
    //MARK: - Funcoes extras
    //Função para armazenar os ultimos 8 frames da camera
    func lastFramesControl(uiImage:UIImage) {
        if lastFrames.count < 8 {
            lastFrames.append(uiImage)
        } else if lastFrames.count == 8 {
            lastFrames.removeFirst()
            lastFrames.append(uiImage)
        }
    }
    
    func changeCamera2() {
        captureSession.beginConfiguration()
        if backCameraOn {
            print("Entrou no if")
            captureSession.removeInput(backCameraInput)
            captureSession.addInput(frontCameraInput)
            backCameraOn = false
        } else {
            captureSession.removeInput(frontCameraInput)
            captureSession.addInput(backCameraInput)
            backCameraOn = true
        }
        self.videoOutput.connections.first?.videoRotationAngle = 90
        self.captureSession.commitConfiguration()
    }
    
    func changeCamera() {
        //Reconfigura o input
        changeCamera2()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            print("Entrou no DispatchQueue")
            self.changeCamera2()
            print("Entrou no DispatchQueue: \(self.backCameraOn)")
        }
    }
}
