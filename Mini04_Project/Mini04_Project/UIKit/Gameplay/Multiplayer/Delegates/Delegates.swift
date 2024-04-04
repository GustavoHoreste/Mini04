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
        //MARK: - Camera
//        self.camera = CameraModel(delegate: self)
        changeButton.delegate = self
        changeCount.delegate = self
        photoButton.delegate = self
        items.delegate = self
        timerRound.delegate = self
        timerObject.delegate = self
        special.delegate = self
        powers.delegate = self
        timerStart.delegate = self
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
        changeCount.subtractCount()
        changeButton.rotateAnimate()
        print("Change Touched")
    }
}

extension GameplayViewModel: ChangeCountLabelDelegate {
    func countEnded() {
        changeButton.alpha = 0.3
        changeButton.isUserInteractionEnabled = false
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
                    DispatchQueue.main.async{
                        self.items.findedObject()
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
        pontos.plusAnimate(color: .green)
        multiVM?.localPlayer?.points += 1
        upadatePoint((multiVM?.localPlayer!.points)!)
    }
    
    func upadatePoint(_ value: Int){
        pontos.updateLabel(value)
    }
}

extension GameplayViewModel: TimerStartDelegate {
    func timerStartOver() {
        fadeBackground.removeFromSuperview()
        timerRound.playTimer()
        timerObject.playTimer()
        configMatch()
        objectName.isHidden = false
        controller!.view.isUserInteractionEnabled = true
    }
}

extension GameplayViewModel: TimerRoundDelegate {
    func timerRoundOver() {
        print(self.controller?.navigationController?.viewControllers.count as Any)
        
        self.multiVM?.resetPowerUpsAndStatus()
        
//        logo.isHidden = false
        
        self.timerObject.timer.invalidate()
        self.timerRound.timer.invalidate()
        
        print("Esse e o valor da quantidade de rounds\(self.multiVM?.configMatch.amoutRound as Any) e o valor de round e \(self.round.number)")
        guard let multiVMNotOpcional = self.multiVM else {return}
        
        if self.round.number >= multiVMNotOpcional.configMatch.amoutRound{
            self.controller?.navigationCoordinator.push(.finalRank)
            return
        }else{
            let nextScreen = controller?.parcialRanking
            nextScreen?.partialResultVM.currentRound = self.round.number
            
            nextScreen?.partialResultVM.timerBeforeButtonReady.startCount()
            nextScreen?.partialResultVM.readyButton.toggleIsHiden()
            
            self.controller?.navigationController?.pushViewController(nextScreen!, animated: false)
        }
        
//        UIView.animate(withDuration: 1.0, animations: {
//            self.logo.transform = CGAffineTransform(scaleX: 100.0, y: 100.0).concatenating(CGAffineTransform(rotationAngle: -CGFloat.pi / 6))
//        }, completion: { [self] _ in
//            
//        })
    }
}


extension GameplayViewModel: TimerObjectDelegate {
    func timerObjectOver() {
        items.chooseObject()
        objectName.text = items.shuffleIsOn ? items.toFindShuffled : items.toFindObject
        timerObject.resetTimerObject()
        changeButton.rotateAnimate()
        items.shuffleIsOn = false
    }
}


//MARK: - Lógica dos poderzinhos
extension GameplayViewModel: PowersButtonDelegate {
    func reciveHidrance(powerType: PowerUps) {
        switch powerType{
        case .freeze:
            powers.freezePower()
            animatePower(icon: UIImage(systemName: "1.circle.fill")!, name: "Freeze")
        case .subtrac:
            subtractPower()
            animatePower(icon: UIImage(systemName: "2.circle.fill")!, name: "Subtract")
        case .switchWord:
            changeButtonAction()
            animatePower(icon: UIImage(systemName: "3.circle.fill")!, name: "Change")
        case .shuffleWord:
            items.shufflePower()
            animatePower(icon: UIImage(systemName: "4.circle.fill")!, name: "Shuffle")
        case .changeCamera: break
            //MARK: - Camera
//            camera.changeCamera()
//            animatePower(icon: UIImage(systemName: "5.circle.fill")!, name: "Switch")
        }
    }
    
    
    func powerButtonAction(powerType: PowerUps) {
        powers.removePower(powerType: powerType)
        print(powerType)
        switch powerType{
        case .freeze:
            //Função de congelar a câmera
            self.multiVM?.sendHidrancesForRandonPlayer(.freeze)
            //            self.reciveHidrance(powerType: .freeze)
        case .switchWord:
            //Função de trocar objeto
            self.multiVM?.sendHidrancesForRandonPlayer(.switchWord)
            //            self.reciveHidrance(powerType: .switchWord)
        case .subtrac:
            //Função de subtrair os pontos
            self.multiVM?.sendHidrancesForRandonPlayer(.subtrac)
            //            self.reciveHidrance(powerType: .subtrac)
        case .changeCamera:
            //Função que troca a câmera
            self.multiVM?.sendHidrancesForRandonPlayer(.changeCamera)
            //            self.reciveHidrance(powerType: .changeCamera)
        case .shuffleWord:
            //Função que embaralha o nome do objeto
            self.multiVM?.sendHidrancesForRandonPlayer(.shuffleWord)
            //            self.reciveHidrance(powerType: .shuffleWord)
        }
    }
    
    func subtractPower() {
        multiVM?.localPlayer?.points -= 1
        upadatePoint((multiVM?.localPlayer!.points)!)
        pontos.plusAnimate(color: .red)
    }
    
    func animatePower(icon: UIImage, name: String) {
        alert.iconPower.image = icon
        alert.namePower.text = name
        
        print("CHEGOU NA ANIMATE POWER")
        
        self.alert.translatesAutoresizingMaskIntoConstraints = true
        
        UIView.animate(withDuration: 1.0, animations: {
            self.alert.center.x -= 150
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                UIView.animate(withDuration: 1.0, animations: {
                    self.alert.center.x += 150
                }) { _ in
                    
                }
            }
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

extension GameplayViewModel: PowersStackViewDelegate {
    func animatePower(imagem: UIImage?, power: PowerUps?) {
        guard let controller = controller else { return }
        
        let power = PowersButton(imagem: imagem!, power: power!)
        
        power.alpha = 0
        
        controller.view.addSubview(power)
        
        NSLayoutConstraint.activate([
            power.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            power.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor, constant: -80),
        ])
        
        if powers.numberOfPowers == 2 {
            UIView.animate(withDuration: 1.0, animations: {
                power.alpha = 1
            }) { _ in
                power.translatesAutoresizingMaskIntoConstraints = true
                UIView.animate(withDuration: 1.0, animations: {
                    power.center = self.powers.center
                    power.center.x = self.powers.center.x + 65
                }) { _ in
                    power.removeFromSuperview()
                    self.powers.usersPowers.last!.alpha = 1
                }
            }
            return
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            power.alpha = 1
        }) { _ in
            power.translatesAutoresizingMaskIntoConstraints = true
            UIView.animate(withDuration: 1.0, animations: {
                power.center = self.powers.center
            }) { _ in
                power.removeFromSuperview()
                self.powers.usersPowers.last!.alpha = 1
            }
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
