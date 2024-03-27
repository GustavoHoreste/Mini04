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
    var navigationCoordinator: Coordinator
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameplayVM.controller = self
        gameplayVM.multiVM = multiVM
        gameplayVM.configMatch()
        gameplayVM.starCombine()
        setupView()
    }
    
    init(multiVM: MultiplayerManagerViewModel, navigationCoordinator: Coordinator) {
        self.multiVM = multiVM
        self.navigationCoordinator = navigationCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
