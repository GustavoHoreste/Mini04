//
//  Delegates.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import Foundation
import UIKit
import AVFoundation
import CoreImage

extension GameplayViewModel {
    func setupDelegate() {
        self.camera = CameraModel(delegate: self)
        changeButton.delegate = self
        photoButton.delegate = self
        items.delegate = self
        timerRound.delegate = self
        timerObject.delegate = self
        for power in powers.allPowers {
            power.delegate = self
        }
    }
}

extension GameplayViewModel: ChangeButtonDelegate {
    func changeButtonAction() {
        items.chooseObject()
        objectName.text = items.shuffleIsOn ? items.toFindShuffled : items.toFindObject
        timerObject.resetTimerObject()
        items.shuffleIsOn = false
        print("Change Touched")
    }
}

extension GameplayViewModel: PhotoButtonDelegate {
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
                        self.objectName.text = self.items.shuffleIsOn ? self.items.toFindShuffled : self.items.toFindObject
                        self.timerObject.resetTimerObject()
                        self.items.shuffleIsOn = false
                    }
                }
                if await special.specialIsOn && (items.specialObject == returnedTargetObject){
                    items.specialObject = ""
                    DispatchQueue.main.async {
                        self.special.specialFinded()
                        self.pontos.number += 2
                        self.powers.addPowers()
                    }
                }
            }catch {
                print(error)
            }
        }
        print("Photo Touched")
    }
}

extension GameplayViewModel: ItemsDelegate {
    func findedObjectAction() {
        pontos.number += 1
    }
}

extension GameplayViewModel: TimerRoundDelegate {
    
    func timerRoundOver() {
        let nextScreen = PartialResultViewController(data: [])
        controller?.navigationController!.pushViewController(nextScreen, animated: false)
    }
}

extension GameplayViewModel: TimerObjectDelegate {
    func timerObjectOver() {
        changeButtonAction()
    }
}

extension GameplayViewModel: PowersButtonDelegate {
    func powerButtonAction(powerType: PowerUps) {
        powers.removePower(powerType: powerType)
        print(powerType)
        switch powerType{
        case .freeze:
            print("")
            //Função de congelar a câmera
            powers.freezePower()
        case .switchWord:
            print("")
            //Função de trocar objeto
            changeButtonAction()
        case .subtrac:
            print("")
            //Função de subtrair os pontos
            pontos.subtractPower()
        case .changeCamera:
            print("")
            //Função que troca a câmera
            camera.changeCamera()
        case .shuffleWord:
            print("")
            //Função que embaralha o nome do objeto
            items.shufflePower()
        }
    }
}

extension GameplayViewModel: SpecialObjectImageDelegate {
    func specialAppeared() {
        //Precisar fazer algo quando o Objeto Especial aparecer
    }
}

extension GameplayViewModel: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    //Captura o buffer da imagem e armazena a UIimage dele na variavel frames
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let uiImage = imageFromSampleBuffer(sampleBuffer: sampleBuffer) else { return }
        if !powers.freezeIsOn {
            DispatchQueue.main.async { [unowned self] in
                self.cameraImage.image = uiImage
            }
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
