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
        view.addSubview(recordVM.background)
        view.addSubview(recordVM.scoreMold)
        view.addSubview(recordVM.results)
        view.addSubview(recordVM.highscore)
        view.addSubview(recordVM.menu)
//        view.addSubview(recordVM.restart)
        view.addSubview(recordVM.logo)
        
        NSLayoutConstraint.activate([
            recordVM.background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            recordVM.background.widthAnchor.constraint(equalTo: view.widthAnchor),
            recordVM.background.heightAnchor.constraint(equalTo: view.heightAnchor),

            recordVM.scoreMold.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.scoreMold.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            recordVM.results.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.results.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            
            recordVM.highscore.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.highscore.topAnchor.constraint(equalTo: recordVM.results.bottomAnchor, constant: 100),
            
            recordVM.menu.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            recordVM.menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
//            recordVM.restart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            recordVM.restart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            recordVM.logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordVM.logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

    }
    
}
