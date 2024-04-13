//
//  ConstraintsSP.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 22/03/24.
//

import Foundation
import UIKit

extension SingleViewController {
    func setupView() {
        view.addSubview(gameplayVM.cameraImage)
        
        view.addSubview(gameplayVM.pointsMold)
        view.addSubview(gameplayVM.roundMold)
        view.addSubview(gameplayVM.timerObjMold)
        view.addSubview(gameplayVM.nameObjMold)
        
        view.addSubview(gameplayVM.objectName)
        view.addSubview(gameplayVM.changeButton)
        view.addSubview(gameplayVM.changeCount)
        view.addSubview(gameplayVM.photoButton)
        view.addSubview(gameplayVM.pontos)
        view.addSubview(gameplayVM.round)
        view.addSubview(gameplayVM.timerRound)
        view.addSubview(gameplayVM.timerObject)
        view.addSubview(gameplayVM.crosshair)
        view.addSubview(gameplayVM.feedback)
        view.addSubview(gameplayVM.logo)
        view.addSubview(gameplayVM.fadeBackground)
        view.addSubview(gameplayVM.timerStart)
                
        NSLayoutConstraint.activate([
            gameplayVM.cameraImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.cameraImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gameplayVM.cameraImage.heightAnchor.constraint(equalTo: view.heightAnchor),
            gameplayVM.cameraImage.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3.0/4.0),
            
            
            gameplayVM.pointsMold.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            gameplayVM.pointsMold.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            gameplayVM.roundMold.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            gameplayVM.roundMold.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            gameplayVM.timerObjMold.bottomAnchor.constraint(equalTo: gameplayVM.roundMold.bottomAnchor, constant: 5),
            gameplayVM.timerObjMold.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gameplayVM.nameObjMold.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.nameObjMold.topAnchor.constraint(equalTo: gameplayVM.timerObjMold.bottomAnchor, constant: 10),
            
            gameplayVM.objectName.centerXAnchor.constraint(equalTo: gameplayVM.nameObjMold.centerXAnchor),
            gameplayVM.objectName.centerYAnchor.constraint(equalTo: gameplayVM.nameObjMold.centerYAnchor),
            
            gameplayVM.changeButton.centerYAnchor.constraint(equalTo: gameplayVM.nameObjMold.centerYAnchor),
            gameplayVM.changeButton.leadingAnchor.constraint(equalTo: gameplayVM.nameObjMold.trailingAnchor, constant: 5),
            
            gameplayVM.changeCount.trailingAnchor.constraint(equalTo: gameplayVM.changeButton.trailingAnchor),
            gameplayVM.changeCount.bottomAnchor.constraint(equalTo: gameplayVM.changeButton.bottomAnchor),
            
            gameplayVM.photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.photoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            
            gameplayVM.pontos.centerXAnchor.constraint(equalTo: gameplayVM.pointsMold.centerXAnchor),
            gameplayVM.pontos.centerYAnchor.constraint(equalTo: gameplayVM.pointsMold.centerYAnchor),
            
            gameplayVM.round.topAnchor.constraint(equalTo: gameplayVM.roundMold.topAnchor, constant: 10),
            gameplayVM.round.centerXAnchor.constraint(equalTo: gameplayVM.roundMold.centerXAnchor),
            
            gameplayVM.timerRound.centerXAnchor.constraint(equalTo: gameplayVM.round.centerXAnchor),
            gameplayVM.timerRound.topAnchor.constraint(equalTo: gameplayVM.round.bottomAnchor),
            
            gameplayVM.timerObject.centerXAnchor.constraint(equalTo: gameplayVM.timerObjMold.centerXAnchor),
            gameplayVM.timerObject.centerYAnchor.constraint(equalTo: gameplayVM.timerObjMold.centerYAnchor),
            
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
            
            gameplayVM.feedback.topAnchor.constraint(equalTo: view.topAnchor),
            gameplayVM.feedback.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gameplayVM.feedback.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameplayVM.feedback.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
