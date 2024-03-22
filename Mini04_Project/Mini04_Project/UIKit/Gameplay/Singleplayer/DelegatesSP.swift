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
        self.camera = CameraModel(delegate: self)
        changeButton.delegate = self
        photoButton.delegate = self
        items.delegate = self
        timerRound.delegate = self
        timerObject.delegate = self
    }
}

extension SingleViewModel: ChangeButtonDelegate {
    func changeButtonAction() {
        items.chooseObject()
        objectName.text = items.shuffleIsOn ? items.toFindShuffled : items.toFindObject
        timerObject.resetTimerObject()
        changeButton.subtractCount()
        print("Change Touched")
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
                    items.findedObject()
                    DispatchQueue.main.async{
                        self.objectName.text = self.items.toFindObject
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
        pontos.number += 1
    }
}

extension SingleViewModel: TimerRoundDelegate {
    
    func timerRoundOver() {
        logo.isHidden = false
        UIView.animate(withDuration: 2.0, animations: {
            self.logo.transform = CGAffineTransform(scaleX: 100.0, y: 100.0)
        }, completion: { _ in
            let nextScreen = PartialResultViewController(data: [])
            self.controller?.navigationController!.pushViewController(nextScreen, animated: false)
        })
    }
}

extension SingleViewModel: TimerObjectDelegate {
    func timerObjectOver() {
        items.chooseObject()
        objectName.text = items.toFindObject
        timerObject.resetTimerObject()
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
