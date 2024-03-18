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
        
        NSLayoutConstraint.activate([
            gameplayVM.objectName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.objectName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            gameplayVM.changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.changeButton.topAnchor.constraint(equalTo: gameplayVM.objectName.bottomAnchor, constant: 20),
            
            gameplayVM.photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.photoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            gameplayVM.cameraImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameplayVM.cameraImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gameplayVM.cameraImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            gameplayVM.cameraImage.heightAnchor.constraint(equalTo: gameplayVM.cameraImage.widthAnchor, multiplier: 4.0/3.0),

        ])
    }
    
}
