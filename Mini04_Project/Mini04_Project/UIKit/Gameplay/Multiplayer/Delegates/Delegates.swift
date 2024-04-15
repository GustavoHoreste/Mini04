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
        self.camera = CameraModel(delegate: self)
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

//MARK: - CHANGE OBJETO QUANDO APERTA NO BOTAO HAPTICS AQUI
extension GameplayViewModel: ChangeButtonDelegate {
    func changeButtonAction() {
        self.haptics.doHaptic(type: .objectChange)
        items.chooseObject()
        objectName.name = items.shuffleIsOn ? items.toFindShuffled : items.toFindObject
        timerObject.resetTimerObject()
        items.shuffleIsOn = false
        changeCount.subtractCount()
        changeButton.rotateAnimate()
        print("Change Touched")
    }
}

extension GameplayViewModel: ChangeCountLabelDelegate {
    func countEnded() {
        self.haptics.doHaptic(type: .roundOver)
        changeButton.alpha = 0.3
        changeButton.isUserInteractionEnabled = false
    }
}

extension GameplayViewModel: PhotoButtonDelegate {
    func photoButtonAction() {
        print("entrei no photoButtonAction")
        Task{
            do{
                guard let cameraImage = await self.cameraImage.image else {return}
                let returnedTargetObject = try await model.verifyObject(image: cameraImage)
                let returnedTargetColor = try await model.verifyColor(image: cameraImage)
                print(returnedTargetObject)
                print(returnedTargetColor)
                //MARK: - QUANDO A PESSOA ACERTA UM OBJETO HAPTICS AQUI
                if returnedTargetObject == items.toFindObject || returnedTargetColor == items.toFindObject{
                    DispatchQueue.main.async{
                        self.haptics.doHaptic(type: .rightObject)
                        self.items.findedObject()
                        self.objectName.name = self.items.shuffleIsOn ? self.items.toFindShuffled : self.items.toFindObject
                        self.timerObject.resetTimerObject()
                        self.items.shuffleIsOn = false
                    }
                }
                //MARK: - QUANDO A PESSOA ACERTA O OBJETO ESPECIAL HAPTICS AQUI
                if items.specialObject == returnedTargetObject && multiVM?.configMatch.powerUps == true{
                    items.specialObject = ""
                    let specialObject = SpecialObject(objectName: items.specialObject, isHit: true)
                    await self.feedback.animateAppear(type: .green)
                    DispatchQueue.main.async { [self] in
                        self.haptics.doHaptic(type: .specialObject)
                        self.special.specialFinded()
                        self.multiVM?.sendEspcialObject(specialObject)
                        self.multiVM?.localPlayer?.points += 30
                        self.pontos.number += 30
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
        print(timerObject.segundos)
        let convertedPts = timerObject.segundos.converterPontos(tempoObj: 20)
        pontos.plusAnimate(color: .green)
        feedback.animateAppear(type: .green)
        multiVM?.localPlayer?.points += convertedPts
        pontos.number += convertedPts
    }
}

//srtar gameplay
extension GameplayViewModel: TimerStartDelegate {
    func timerStartOver() {
        fadeBackground.isHidden = true
        timerRound.playTimer()
        timerObject.playTimer()
        objectName.isHidden = false
        special.configTimerAppeerEspecialObject((multiVM?.configMatch.roundTime)!)
        self.configMatch()
        self.configTimeMatch()
        self.changeCount.number = 3
        self.changeCount.alpha = 1
        self.changeButton.alpha = 1
        self.changeButton.isUserInteractionEnabled = true
        controller!.view.isUserInteractionEnabled = true
//        verifyUsersToPowers()
    }
    
    func verifyUsersToPowers() {
        print("AMOUTROUND \(round.number)")
        if round.number > 1 {
            var players = multiVM?.adversaryPlayers
            players?.append((multiVM?.localPlayer)!)
            if let doisMenoresValores = players?.sorted(by: {$0.points < $1.points}).prefix(2) {
                print("DOIS MENORES VALORES: \(doisMenoresValores[0].userName) - [\(doisMenoresValores[0].points)]\n\(doisMenoresValores[1].userName) - [\(doisMenoresValores[1].points)]")
                for player in doisMenoresValores{
                    if player.id == multiVM?.localPlayer?.id{
                        print("PASSOU NO IF")
                        self.powers.addPowers()
                        break
                    }
                    print("nao e igual")
                }
            }
        }
    }
}

extension GameplayViewModel: TimerRoundDelegate {
    func timerRoundOver() {
        self.multiVM?.resetPowerUpsAndStatus()
        special.specialFinded()
        self.pontos.number = 0
        logo.isHidden = false
        
        self.timerObject.timer.invalidate()
        self.timerRound.timer.invalidate()
        
        guard let multiVMNotOpcional = self.multiVM else {return}
        
        if self.round.number >= multiVMNotOpcional.configMatch.amoutRound{
            let nextScreen = controller?.finalRanking
            self.controller?.navigationController?.pushViewController(nextScreen!, animated: false)
            return
        }else{
            self.round.number += 1
            let nextScreen = controller?.parcialRanking
            nextScreen?.configureParcialVC()
            nextScreen?.partialResultVM.timerBeforeButtonReady.startCount()
            nextScreen?.partialResultVM.readyButton.toggleIsHiden()
            nextScreen?.partialResultVM.cinfigureLabelReadyButton()
            self.logo.translatesAutoresizingMaskIntoConstraints = true
            UIView.animate(withDuration: 2.0, animations: {
                self.logo.center.y -= (self.controller!.view.frame.height + self.controller!.view.frame.height * 0.4)
            }, completion: {_ in
                self.logo.isHidden = true
                self.logo.resetAnimationGameplay()
                self.controller?.navigationController?.pushViewController(nextScreen!, animated: false)
            })
        }
        
    }
}

//MARK: - CHANGE OBJETO QUANDO OBJETO ACABA HAPTICS AQUI
extension GameplayViewModel: TimerObjectDelegate {
    func timerObjectOver() {
        self.haptics.doHaptic(type: .objectChange)
        items.chooseObject()
        objectName.name = items.shuffleIsOn ? items.toFindShuffled : items.toFindObject
        timerObject.resetTimerObject()
        changeButton.rotateAnimate()
        feedback.animateAppear(type: .yellow)
        items.shuffleIsOn = false
    }
}


//MARK: - Lógica dos poderzinhos
extension GameplayViewModel: PowersButtonDelegate {
    func reciveHidrance(powerType: PowerUps) {
        self.haptics.doHaptic(type: .receivedPower)
        switch powerType{
        case .freeze:
            freezePower()
            animatePower(icon: UIImage(systemName: "1.circle.fill")!, name: "Freeze")
        case .subtrac:
            subtractPower()
            animatePower(icon: UIImage(systemName: "3.circle.fill")!, name: "Subtract")
        case .switchWord:
            changeButtonAction()
            animatePower(icon: UIImage(systemName: "2.circle.fill")!, name: "Change")
        case .shuffleWord:
            items.shufflePower()
            animatePower(icon: UIImage(systemName: "5.circle.fill")!, name: "Shuffle")
        case .changeCamera:
            //MARK: - Camera
            camera.changeCamera()
            animatePower(icon: UIImage(systemName: "4.circle.fill")!, name: "Switch")
        }
    }
    
    
    func powerButtonAction(powerType: PowerUps) {
        self.haptics.doHaptic(type: .usePower)
        powers.removePower(powerType: powerType)
        print("ACAO PODER \(powerType)")
        self.haptics.doHaptic(type: .usePower)
        switch powerType{
        case .freeze:
            //Função de congelar a câmera
            self.multiVM?.sendHidrancesForRandonPlayer(.freeze)
//                        self.reciveHidrance(powerType: .freeze)
        case .switchWord:
            //Função de trocar objeto
            self.multiVM?.sendHidrancesForRandonPlayer(.switchWord)
//                        self.reciveHidrance(powerType: .switchWord)
        case .subtrac:
            //Função de subtrair os pontos
            self.multiVM?.sendHidrancesForRandonPlayer(.subtrac)
//                        self.reciveHidrance(powerType: .subtrac)
        case .changeCamera:
            //Função que troca a câmera
            self.multiVM?.sendHidrancesForRandonPlayer(.changeCamera)
//                        self.reciveHidrance(powerType: .changeCamera)
        case .shuffleWord:
            //Função que embaralha o nome do objeto
            self.multiVM?.sendHidrancesForRandonPlayer(.shuffleWord)
//                        self.reciveHidrance(powerType: .shuffleWord)
        }
    }
    
    func subtractPower() {
        multiVM?.localPlayer?.points -= 15
        self.pontos.number -= 15
        feedback.animateAppear(type: .red)
        pontos.plusAnimate(color: .red)
    }
    
    func freezePower() {
        guard let controller = controller else {return}
        
        powers.freezeIsOn = true
        
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: controller.view.center.x, y: -100)
        
        let colors: [UIColor] = [
            .white
        ]
        
        let cells: [CAEmitterCell] = colors.compactMap{
            let cell = CAEmitterCell()
            cell.scale = 0.05
            cell.emissionRange = .pi * 2
            cell.lifetime = 10
            cell.birthRate = 50
            cell.velocity = 150
            cell.color = $0.cgColor
            cell.contents = UIImage(named: "CircleFreeze")!.cgImage
            return cell
        }
        
        layer.emitterCells = cells
        
        powers.freezeBG.alpha = 0
        
        controller.view.addSubview(powers.freezeBG)
        controller.view.layer.addSublayer(layer)
        
        NSLayoutConstraint.activate([
            powers.freezeBG.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            powers.freezeBG.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor),
        ])
        
        UIView.animate(withDuration: 1.0, animations: {
            self.powers.freezeBG.alpha = 1
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.powers.freezeIsOn = false
            UIView.animate(withDuration: 1.0, animations: {
                self.powers.freezeBG.alpha = 0
            }){ _ in
                self.powers.freezeBG.removeFromSuperview()
                layer.removeFromSuperlayer()
            }
        }
        
    }
    
    func animatePower(icon: UIImage, name: String) {
        guard let controller = controller else {return}
        
        alert.center.x = alert.centerX
        
        guard !alert.isAlertAnimating else {
            alert.layer.removeAllAnimations()
            alert.center.x = alert.centerX
            alert.isAlertAnimating = false
            animatePower(icon: icon, name: name)
            return
        }
        
        alert.isAlertAnimating = true
        
        alert.iconPower.image = icon
        alert.namePower.text = name
        
        controller.view.bringSubviewToFront(alert)
        
        print("CENTER DO ALERT: \(alert.center)")
        
        self.alert.translatesAutoresizingMaskIntoConstraints = true
        
        UIView.animate(withDuration: 1.0, animations: {
            self.alert.center.x -= 210
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                UIView.animate(withDuration: 1.0, animations: {
                    self.alert.center.x += 210
                }) { _ in
                    self.alert.translatesAutoresizingMaskIntoConstraints = false
                    self.alert.isAlertAnimating = false
                }
            }
        }
    }
}

//MARK: - QUANDO O OBJETO ESPECIAL APARECE HAPTICS AQUI
extension GameplayViewModel: SpecialObjectImageDelegate {
    func specialAppeared() {
        //Precisar fazer algo quando o Objeto Especial aparecer
        self.haptics.doHaptic(type: .specialObject)
        if multiVM?.configMatch.powerUps == true{
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
        
        if powers.firstMold == nil {
            UIView.animate(withDuration: 1.0, animations: {
                power.alpha = 1
            }) { _ in
                power.translatesAutoresizingMaskIntoConstraints = true
                UIView.animate(withDuration: 1.0, animations: {
                    power.center.y = self.powers.center.y + 30
                    power.center.x = self.powers.center.x - 80
                }) { _ in
                    print("CHEGOU FIRSTMOLD")
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
                power.center.y = self.powers.center.y + 30
                power.center.x = self.powers.center.x + 80
            }) { _ in
                print("CHEGOU SECONDMOLD")
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
