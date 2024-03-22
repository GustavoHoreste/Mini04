//
//  GameplayViewController.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import UIKit

class GameplayViewController: UIViewController {
    
    var gameplayVM = GameplayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameplayVM.controller = self
        
        setupView()
    }
    
}
