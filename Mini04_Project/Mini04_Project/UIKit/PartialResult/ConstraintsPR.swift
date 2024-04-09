//
//  ConstraintsVC.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 20/03/24.
//

import UIKit

extension PartialResultViewController {
    
    func setupView() {
        collection.dataSource = dataSource
        collection.delegate = self
        
        
        view.addSubview(partialResultVM.backGroundImage)
        view.addSubview(partialResultVM.exit)
        view.addSubview(collection)
        view.addSubview(partialResultVM.endGameButton)
        view.addSubview(partialResultVM.partialResultsTitle)
        view.addSubview(partialResultVM.readyButton)
        
        view.addSubview(partialResultVM.timerBeforeButtonReady)
        
        view.addSubview(partialResultVM.logo)
        
        NSLayoutConstraint.activate([
            
            partialResultVM.backGroundImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            partialResultVM.backGroundImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            partialResultVM.backGroundImage.widthAnchor.constraint(equalToConstant: view.frame.width + view.frame.width * 0.1),
            partialResultVM.backGroundImage.heightAnchor.constraint(equalToConstant: view.frame.height + view.frame.height * 0.1),
            
            partialResultVM.exit.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            partialResultVM.exit.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            partialResultVM.partialResultsTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 35.0),
            partialResultVM.partialResultsTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
        
            partialResultVM.readyButton.widthAnchor.constraint(equalToConstant: 120),
            partialResultVM.readyButton.heightAnchor.constraint(equalToConstant: 120),
            partialResultVM.readyButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            partialResultVM.readyButton.bottomAnchor.constraint(equalTo: partialResultVM.endGameButton.topAnchor),
            
            partialResultVM.endGameButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            partialResultVM.endGameButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            partialResultVM.endGameButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            partialResultVM.endGameButton.heightAnchor.constraint(equalToConstant: 80),
            
            partialResultVM.logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            partialResultVM.logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            partialResultVM.timerBeforeButtonReady.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            partialResultVM.timerBeforeButtonReady.bottomAnchor.constraint(equalTo: partialResultVM.endGameButton.topAnchor, constant: -100),
            
            collection.topAnchor.constraint(equalTo: partialResultVM.partialResultsTitle.bottomAnchor),
            collection.bottomAnchor.constraint(equalTo: partialResultVM.readyButton.topAnchor),
            collection.leftAnchor.constraint(equalTo: view.leftAnchor),
            collection.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
}
