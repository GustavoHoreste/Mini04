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
        view.addSubview(gameplayVM.cameraImage)
        view.addSubview(gameplayVM.objectName)
        view.addSubview(gameplayVM.changeButton)
        view.addSubview(gameplayVM.photoButton)
        view.addSubview(gameplayVM.profile)
        view.addSubview(gameplayVM.pontos)
        view.addSubview(gameplayVM.round)
        view.addSubview(gameplayVM.special)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            gameplayVM.objectName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.objectName.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            gameplayVM.changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.changeButton.topAnchor.constraint(equalTo: gameplayVM.objectName.bottomAnchor, constant: 10),
            
            gameplayVM.photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.photoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            gameplayVM.cameraImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.cameraImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gameplayVM.cameraImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            gameplayVM.cameraImage.heightAnchor.constraint(equalTo: gameplayVM.cameraImage.widthAnchor, multiplier: 4.0/3.0),
            
            gameplayVM.profile.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            gameplayVM.profile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            gameplayVM.pontos.centerXAnchor.constraint(equalTo: gameplayVM.profile.centerXAnchor),
            gameplayVM.pontos.topAnchor.constraint(equalTo: gameplayVM.profile.bottomAnchor, constant: 5),
            
            gameplayVM.round.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            gameplayVM.round.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            gameplayVM.special.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.special.bottomAnchor.constraint(equalTo: gameplayVM.photoButton.topAnchor, constant: -10)

        ])
    }
    
}
