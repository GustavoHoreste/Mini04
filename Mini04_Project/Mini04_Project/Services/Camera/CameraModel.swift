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
    //Frame atual da camera
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
    var videoOutput: AVCaptureVideoDataOutput!
    
    //Verifica se o usuario permitio o uso da camera
    var permission:Bool = true
    
    var context:CIContext = CIContext()
    
    override init() {
        super.init()
        self.setupAndStartSession()
    }
    
    //MARK: - Camera session setup
    func setupAndStartSession() {
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
    func setupOutputs() {
        videoOutput = AVCaptureVideoDataOutput()
        let videoQueue = DispatchQueue(label: "videoQueue", qos: .userInitiated)
        videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        } else {
            fatalError("Could not add output")
        }
        
        videoOutput.connections.first?.videoRotationAngle = 90
        
        videoOutput.connections.first?.isVideoMirrored = true
    }
    
    func setupInputs() {
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
    func checkPermission() {
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
    func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] permission in
            self.permission = permission
        }
    }
    
    //Função para armazenar os ultimos 8 frames da camera
    func lastFramesControl(uiImage:UIImage) {
        if lastFrames.count < 8 {
            lastFrames.append(uiImage)
        } else if lastFrames.count == 8 {
            lastFrames.removeFirst()
            lastFrames.append(uiImage)
        }
    }
}
