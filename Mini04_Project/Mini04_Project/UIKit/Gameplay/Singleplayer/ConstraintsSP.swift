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
        view.addSubview(gameplayVM.objectName)
        view.addSubview(gameplayVM.changeButton)
        view.addSubview(gameplayVM.changeCount)
        view.addSubview(gameplayVM.photoButton)
        view.addSubview(gameplayVM.profile)
        view.addSubview(gameplayVM.pontos)
        view.addSubview(gameplayVM.round)
        view.addSubview(gameplayVM.timerRound)
        view.addSubview(gameplayVM.timerObject)
        view.addSubview(gameplayVM.crosshair)
        view.addSubview(gameplayVM.logo)
                
        NSLayoutConstraint.activate([
            gameplayVM.objectName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.objectName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            gameplayVM.changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.changeButton.topAnchor.constraint(equalTo: gameplayVM.objectName.bottomAnchor, constant: 10),
            
            gameplayVM.changeCount.trailingAnchor.constraint(equalTo: gameplayVM.changeButton.trailingAnchor),
            gameplayVM.changeCount.bottomAnchor.constraint(equalTo: gameplayVM.changeButton.bottomAnchor),
            
            gameplayVM.photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.photoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            
            gameplayVM.cameraImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.cameraImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gameplayVM.cameraImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            gameplayVM.cameraImage.heightAnchor.constraint(equalTo: gameplayVM.cameraImage.widthAnchor, multiplier: 4.0/3.0),
            
            gameplayVM.profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            gameplayVM.profile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            gameplayVM.pontos.centerXAnchor.constraint(equalTo: gameplayVM.profile.centerXAnchor),
            gameplayVM.pontos.topAnchor.constraint(equalTo: gameplayVM.profile.bottomAnchor, constant: 5),
            
            gameplayVM.round.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            gameplayVM.round.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            gameplayVM.timerRound.centerXAnchor.constraint(equalTo: gameplayVM.round.centerXAnchor),
            gameplayVM.timerRound.topAnchor.constraint(equalTo: gameplayVM.round.bottomAnchor, constant: 5),
            
            gameplayVM.timerObject.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.timerObject.bottomAnchor.constraint(equalTo: gameplayVM.objectName.topAnchor, constant: -10),
            
            gameplayVM.crosshair.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.crosshair.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            gameplayVM.logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
