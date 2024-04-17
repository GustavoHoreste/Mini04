//
//  ConstraintsFR.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import Foundation
import UIKit

extension FinalRakingViewController {
    func setupView() {
        
        collection.dataSource = dataSource
        collection.delegate = self
        
        view.addSubview(finalVM.background)
        view.addSubview(finalVM.userFirst)
        view.addSubview(finalVM.userSecond)
        view.addSubview(finalVM.userThird)
        view.addSubview(finalVM.podio)
        view.addSubview(collection)
        view.addSubview(finalVM.leave)
        view.addSubview(finalVM.recomecar)
        view.addSubview(finalVM.tops)
        
        NSLayoutConstraint.activate([
            finalVM.background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finalVM.background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            finalVM.background.topAnchor.constraint(equalTo: view.topAnchor),
            finalVM.background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            finalVM.background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            finalVM.background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            finalVM.podio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finalVM.podio.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            
            finalVM.userFirst.centerXAnchor.constraint(equalTo: finalVM.podio.centerXAnchor),
            finalVM.userFirst.centerYAnchor.constraint(equalTo: finalVM.podio.centerYAnchor, constant: -130),
            
            finalVM.userSecond.trailingAnchor.constraint(equalTo: finalVM.userFirst.leadingAnchor),
            finalVM.userSecond.centerYAnchor.constraint(equalTo: finalVM.podio.centerYAnchor, constant: -90),
            
            finalVM.userThird.leadingAnchor.constraint(equalTo: finalVM.userFirst.trailingAnchor),
            finalVM.userThird.centerYAnchor.constraint(equalTo: finalVM.podio.centerYAnchor, constant: -50),

            finalVM.leave.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            finalVM.leave.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            finalVM.recomecar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finalVM.recomecar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            finalVM.tops.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            finalVM.tops.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collection.widthAnchor.constraint(equalTo: view.widthAnchor),
            collection.topAnchor.constraint(equalTo: finalVM.podio.bottomAnchor, constant: 20),
            collection.bottomAnchor.constraint(equalTo: finalVM.recomecar.topAnchor, constant: -20),

        ])
    }
}
