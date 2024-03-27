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
        special.delegate = self
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
        changeButton.subtractCount()
        print("Change Touched")
    }
}

extension GameplayViewModel: PhotoButtonDelegate {
    func photoButtonAction() {
        Task{
            do{
                guard let cameraImage = await self.cameraImage.image else {return}
                let returnedTargetObject = try await model.verifyObject(image: cameraImage)
                let returnedTargetColor = try await model.verifyColor(image: cameraImage)
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
                if await special.specialIsOn && (items.specialObject == returnedTargetObject) && multiVM?.configMatch.powerUps == true{
                    items.specialObject = ""
                    let specialObject = SpecialObject(objectName: items.specialObject, isHit: true)
                    DispatchQueue.main.async { [self] in
                        self.special.specialFinded()
                        self.multiVM?.sendEspcialObject(specialObject)
                        self.multiVM?.localPlayer?.points += 2
                        self.upadatePoint((multiVM?.localPlayer!.points)!)
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

//MARK: - Incrementa pontos do jogador
extension GameplayViewModel: ItemsDelegate {
    func findedObjectAction() {
        multiVM?.localPlayer?.points += 1
        upadatePoint((multiVM?.localPlayer!.points)!)
    }
    
    func upadatePoint(_ value: Int){
        pontos.updateLabel(value)
    }
}

extension GameplayViewModel: TimerRoundDelegate {
    
    func timerRoundOver() {
        logo.isHidden = false
        UIView.animate(withDuration: 2.0, animations: {
            self.logo.transform = CGAffineTransform(scaleX: 100.0, y: 100.0).concatenating(CGAffineTransform(rotationAngle: -CGFloat.pi / 6))
        }, completion: { _ in
            self.timerObject.timer.invalidate()
            if self.round.number == self.multiVM?.configMatch.amoutRound{
                self.controller?.navigationCoordinator.push(.finalRank)
                return
            }
            let nextScreen = PartialResultViewController(multiVM: self.multiVM!, navigationCoordinator: self.controller!.navigationCoordinator)
            nextScreen.partialResultVM.currentRound = self.round.number
            self.controller?.navigationController!.pushViewController(nextScreen, animated: false)
        })
    }
}

extension GameplayViewModel: TimerObjectDelegate {
    func timerObjectOver() {
        items.chooseObject()
        objectName.text = items.shuffleIsOn ? items.toFindShuffled : items.toFindObject
        timerObject.resetTimerObject()
        items.shuffleIsOn = false
        print("timer objeto acabou")
    }
}

//MARK: - Lógica dos poderzinhos
extension GameplayViewModel: PowersButtonDelegate {
    func reciveHidrance(powerType: PowerUps) {
        switch powerType{
        case .freeze:
            powers.freezePower()
        case .subtrac:
            pontos.subtractPower()
        case .switchWord:
            changeButtonAction()
        case .shuffleWord:
            items.shufflePower()
        case .changeCamera:
            camera.changeCamera()
        }
    }
    
    
    func powerButtonAction(powerType: PowerUps) {
        powers.removePower(powerType: powerType)
        print(powerType)
        switch powerType{
        case .freeze:
            //Função de congelar a câmera
//            self.multiVM?.sendHidrancesForRandonPlayer(.freeze)
            self.multiVM?.sendHidrancesForRandonPlayer(.changeCamera)
        case .switchWord:
            //Função de trocar objeto
//            self.multiVM?.sendHidrancesForRandonPlayer(.switchWord)
            self.multiVM?.sendHidrancesForRandonPlayer(.changeCamera)
        case .subtrac:
            //Função de subtrair os pontos
//            self.multiVM?.sendHidrancesForRandonPlayer(.subtrac)
            self.multiVM?.sendHidrancesForRandonPlayer(.changeCamera)
        case .changeCamera:
            //Função que troca a câmera
            self.multiVM?.sendHidrancesForRandonPlayer(.changeCamera)
        case .shuffleWord:
            //Função que embaralha o nome do objeto
//            self.multiVM?.sendHidrancesForRandonPlayer(.shuffleWord)
            self.multiVM?.sendHidrancesForRandonPlayer(.changeCamera)
        }
    }
}

extension GameplayViewModel: SpecialObjectImageDelegate {
    func specialAppeared() {
        //Precisar fazer algo quando o Objeto Especial aparecer
        if multiVM?.configMatch.powerUps == true {
            special.specialIsOn = true
            special.isHidden = false
        }
        
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
