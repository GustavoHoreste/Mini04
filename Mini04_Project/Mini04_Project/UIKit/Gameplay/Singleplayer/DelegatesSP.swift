//
//  DelegatesSP.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 22/03/24.
//

import Foundation
import UIKit
import AVFoundation
import CoreImage

extension SingleViewModel {
    func setupDelegate() {
        //MARK: - Camera Removi
        self.camera = CameraModel(delegate: self)
        changeButton.delegate = self
        changeCount.delegate = self
        photoButton.delegate = self
        items.delegate = self
        timerRound.delegate = self
        timerObject.delegate = self
        timerStart.delegate = self
    }
}

extension SingleViewModel: ChangeButtonDelegate {
    func changeButtonAction() {
        self.haptics.doHaptic(type: .objectChange)
        items.chooseObject()
        objectName.name = items.toFindObject
        timerObject.resetTimerObject()
        changeCount.subtractCount()
        changeButton.rotateAnimate()
        print("Change Touched")
    }
}

extension SingleViewModel: ChangeCountLabelDelegate {
    func countEnded() {
        changeButton.alpha = 0.3
        changeButton.isUserInteractionEnabled = false
    }
}

extension SingleViewModel: PhotoButtonDelegate {
    func photoButtonAction() {
        Task{
            do{
                let returnedTargetObject = try await model.verifyObject(image: cameraImage.image!)
                let returnedTargetColor = try await model.verifyColor(image: cameraImage.image!)
                print(returnedTargetObject)
                print(returnedTargetColor)
                if returnedTargetObject == items.toFindObject || returnedTargetColor == items.toFindObject{
                    DispatchQueue.main.async{
                        self.haptics.doHaptic(type: .rightObject)
                        self.items.findedObject()
                        self.objectName.name = self.items.toFindObject
                        self.timerObject.resetTimerObject()
                    }
                }
            }catch {
                print(error)
            }
        }
        print("Photo Touched")
    }
}

extension SingleViewModel: ItemsDelegate {
    func findedObjectAction() {
        let convertedPts = timerObject.segundos.converterPontos(tempoObj: 20)
        pontos.plusAnimate(color: .green)
        feedback.animateAppear(type: .green)
        pontos.number += convertedPts
    }
}

extension SingleViewModel: TimerStartDelegate {
    func timerStartOver() {
        fadeBackground.removeFromSuperview()
        timerRound.playTimer()
        timerObject.playTimer()
        items.chooseObject()
        objectName.name = items.toFindObject
        objectName.isHidden = false
        controller!.view.isUserInteractionEnabled = true
    }
}

extension SingleViewModel: TimerRoundDelegate {
    func timerRoundOver() {
        logo.isHidden = false
        logo.translatesAutoresizingMaskIntoConstraints = true
        UIView.animate(withDuration: 2.0, animations: {
            self.logo.center.y -= (self.controller!.view.frame.height + self.controller!.view.frame.height * 0.4)
        }, completion: { _ in
            let nextScreen = RecordViewController(navigationCoordinator: self.controller!.navigationCoordinator)
            nextScreen.recordVM.results.qntd = self.pontos.number
            self.controller?.navigationController!.pushViewController(nextScreen, animated: false)
        })
    }
}

extension SingleViewModel: TimerObjectDelegate {
    func timerObjectOver() {
        self.haptics.doHaptic(type: .objectTimeOver)
        items.chooseObject()
        objectName.name = items.toFindObject
        timerObject.resetTimerObject()
        changeButton.rotateAnimate()
        feedback.animateAppear(type: .yellow)
    }
}

extension SingleViewModel: AVCaptureVideoDataOutputSampleBufferDelegate {
    //Captura o buffer da imagem e armazena a UIimage dele na variavel frames
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let uiImage = imageFromSampleBuffer(sampleBuffer: sampleBuffer) else { return }
        DispatchQueue.main.async { [unowned self] in
            self.cameraImage.image = uiImage
        }
    }
    
    //Transforma o buffer em UIImage
    private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> UIImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return nil}
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {return nil}
        let uiImage = UIImage(cgImage: cgImage)
        return uiImage
    }
}
