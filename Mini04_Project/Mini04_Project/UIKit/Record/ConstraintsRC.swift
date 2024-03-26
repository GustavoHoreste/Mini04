//
//  ConstraintsRC.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import Foundation
import UIKit

extension RecordViewController {
    
    func setupView() {
        view.addSubview(recordVM.results)
        view.addSubview(recordVM.highscore)
        view.addSubview(recordVM.menu)
        view.addSubview(recordVM.logo)
        
        NSLayoutConstraint.activate([
            recordVM.results.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.results.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            recordVM.highscore.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.highscore.topAnchor.constraint(equalTo: recordVM.results.bottomAnchor, constant: 80),
            
            recordVM.menu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.menu.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),

            recordVM.logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

    }
    
}
