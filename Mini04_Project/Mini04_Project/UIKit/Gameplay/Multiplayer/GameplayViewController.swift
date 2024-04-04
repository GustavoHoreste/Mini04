//
//  GameplayViewController.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import UIKit

class GameplayViewController: UIViewController {
    
    var gameplayVM = GameplayViewModel()
    lazy var parcialRanking = PartialResultViewController(multiVM: self.multiVM, navigationCoordinator: self.navigationCoordinator, gameplayVM: self.gameplayVM)
    var multiVM: MultiplayerManagerViewModel
    var navigationCoordinator: Coordinator
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isUserInteractionEnabled = false
        
        gameplayVM.controller = self
        gameplayVM.multiVM = multiVM
        gameplayVM.starCombine()
         print("Esse e o valor que deveria aparecer na view: \(self.gameplayVM.round.number)")
        gameplayVM.configTimeMatch()
        setupView()
        gameplayVM.timerStart.sizeIncrease()
        
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
