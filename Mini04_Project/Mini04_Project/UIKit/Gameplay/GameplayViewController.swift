//
//  GameplayViewController.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import UIKit

class GameplayViewController: UIViewController {
    
    var gameplayVM = GameplayViewModel()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemGreen
        button.configuration?.title = "Add"
        button.isUserInteractionEnabled = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(addPower), for: .touchUpInside)
        return button
    }()
    
    @objc func addPower() {
        gameplayVM.powers.addPowers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
}
