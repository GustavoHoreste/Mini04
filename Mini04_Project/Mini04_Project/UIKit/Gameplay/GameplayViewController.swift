//
//  GameplayViewController.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import UIKit

class GameplayViewController: UIViewController {
    
    var gameplayVM = GameplayViewModel()
    var multiVM: MultiplayerManagerViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameplayVM.controller = self
        print(multiVM.adversaryPlayers)
        
        setupView()
    }
    
    init(multiVM: MultiplayerManagerViewModel) {
        self.multiVM = multiVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
