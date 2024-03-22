//
//  ConstraintsVC.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 20/03/24.
//

import UIKit

extension PartialResultViewController {
    
    func setupView() {
//        view.addSubview(tableView)
//        tableView.dataSource = self
//        tableView.delegate = self
        
        view.addSubview(collection)
        collection.delegate = self
        
        view.addSubview(partialResultVM.endGameButton)
        view.addSubview(partialResultVM.partialResultsTitle)
        view.addSubview(partialResultVM.readyButton)
        
        NSLayoutConstraint.activate([
            
            partialResultVM.endGameButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            partialResultVM.endGameButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            partialResultVM.endGameButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            partialResultVM.endGameButton.heightAnchor.constraint(equalToConstant: 80),
            
            partialResultVM.partialResultsTitle.topAnchor.constraint(equalTo: partialResultVM.endGameButton.bottomAnchor),
            partialResultVM.partialResultsTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            collection.topAnchor.constraint(equalTo: partialResultVM.partialResultsTitle.bottomAnchor),
            collection.bottomAnchor.constraint(equalTo: partialResultVM.readyButton.topAnchor),
            collection.leftAnchor.constraint(equalTo: view.leftAnchor),
            collection.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            partialResultVM.readyButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            partialResultVM.readyButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            partialResultVM.readyButton.heightAnchor.constraint(equalToConstant: 80),
            partialResultVM.readyButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
}
