//
//  ConstraintsVC.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 20/03/24.
//

import UIKit

extension PartialResultViewController {
    
    func setupView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        view.addSubview(partialResultVM.endGameButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
