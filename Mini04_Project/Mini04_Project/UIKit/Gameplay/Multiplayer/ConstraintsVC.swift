//
//  ConstraintsVC.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import Foundation
import UIKit

extension GameplayViewController {
    
    func setupView() {
        //MARK: - Camera Removi
//        view.addSubview(gameplayVM.cameraImage)
        
        view.addSubview(gameplayVM.pointsMold)
        view.addSubview(gameplayVM.roundMold)
        view.addSubview(gameplayVM.timerObjMold)
        view.addSubview(gameplayVM.nameObjMold)
        
        view.addSubview(gameplayVM.objectName)
        view.addSubview(gameplayVM.changeButton)
        view.addSubview(gameplayVM.changeCount)
        view.addSubview(gameplayVM.pontos)
        view.addSubview(gameplayVM.round)
        view.addSubview(gameplayVM.timerRound)
        view.addSubview(gameplayVM.timerObject)
        view.addSubview(gameplayVM.powers)
        view.addSubview(gameplayVM.crosshair)
        view.addSubview(gameplayVM.alert)
        view.addSubview(gameplayVM.photoButton)
        view.addSubview(gameplayVM.special)
        view.addSubview(gameplayVM.feedback)
        view.addSubview(gameplayVM.fadeBackground)
        view.addSubview(gameplayVM.timerStart)
        view.addSubview(gameplayVM.logo)
                
        NSLayoutConstraint.activate([
            //MARK: - Camera Removi
//            gameplayVM.cameraImage.heightAnchor.constraint(equalToConstant: view.frame.height * 0.9),
//            gameplayVM.cameraImage.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3.0/4.0),
//            gameplayVM.cameraImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            gameplayVM.cameraImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height * 0.05),
            
            //--------Constraints das molduras--------
            gameplayVM.pointsMold.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            gameplayVM.pointsMold.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            gameplayVM.roundMold.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            gameplayVM.roundMold.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            gameplayVM.timerObjMold.bottomAnchor.constraint(equalTo: gameplayVM.roundMold.bottomAnchor, constant: 5),
            gameplayVM.timerObjMold.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gameplayVM.nameObjMold.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.nameObjMold.topAnchor.constraint(equalTo: gameplayVM.timerObjMold.bottomAnchor, constant: 10),
            //------------Fim Molduras----------------
            
            gameplayVM.objectName.centerXAnchor.constraint(equalTo: gameplayVM.nameObjMold.centerXAnchor),
            gameplayVM.objectName.centerYAnchor.constraint(equalTo: gameplayVM.nameObjMold.centerYAnchor),
            
            gameplayVM.changeButton.centerYAnchor.constraint(equalTo: gameplayVM.nameObjMold.centerYAnchor),
            gameplayVM.changeButton.leadingAnchor.constraint(equalTo: gameplayVM.nameObjMold.trailingAnchor, constant: 5),
            
            gameplayVM.changeCount.trailingAnchor.constraint(equalTo: gameplayVM.changeButton.trailingAnchor),
            gameplayVM.changeCount.bottomAnchor.constraint(equalTo: gameplayVM.changeButton.bottomAnchor),
            
            gameplayVM.pontos.centerXAnchor.constraint(equalTo: gameplayVM.pointsMold.centerXAnchor),
            gameplayVM.pontos.centerYAnchor.constraint(equalTo: gameplayVM.pointsMold.centerYAnchor),
            
            gameplayVM.round.topAnchor.constraint(equalTo: gameplayVM.roundMold.topAnchor, constant: 10),
            gameplayVM.round.centerXAnchor.constraint(equalTo: gameplayVM.roundMold.centerXAnchor),
            
            gameplayVM.special.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.special.bottomAnchor.constraint(equalTo: gameplayVM.photoButton.topAnchor, constant: -10),

            gameplayVM.timerRound.centerXAnchor.constraint(equalTo: gameplayVM.round.centerXAnchor),
            gameplayVM.timerRound.topAnchor.constraint(equalTo: gameplayVM.round.bottomAnchor),
            
            gameplayVM.timerObject.centerXAnchor.constraint(equalTo: gameplayVM.timerObjMold.centerXAnchor),
            gameplayVM.timerObject.centerYAnchor.constraint(equalTo: gameplayVM.timerObjMold.centerYAnchor),
            
            gameplayVM.powers.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.powers.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            
            gameplayVM.photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.photoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            
            gameplayVM.crosshair.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.crosshair.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            gameplayVM.logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.logo.topAnchor.constraint(equalTo: view.bottomAnchor),
            
            gameplayVM.fadeBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.fadeBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gameplayVM.fadeBackground.widthAnchor.constraint(equalTo: view.widthAnchor),
            gameplayVM.fadeBackground.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            gameplayVM.timerStart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.timerStart.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            gameplayVM.alert.leadingAnchor.constraint(equalTo: view.trailingAnchor),
            gameplayVM.alert.topAnchor.constraint(equalTo: gameplayVM.changeButton.bottomAnchor, constant: -10),
            
            gameplayVM.feedback.topAnchor.constraint(equalTo: view.topAnchor),
            gameplayVM.feedback.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gameplayVM.feedback.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameplayVM.feedback.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}
