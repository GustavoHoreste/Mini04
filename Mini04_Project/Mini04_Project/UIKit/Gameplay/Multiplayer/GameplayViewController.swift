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
    lazy var finalRanking = FinalRakingViewController(multiVM: self.multiVM, navigationCoordinator: self.navigationCoordinator)
    var multiVM: MultiplayerManagerViewModel
    var navigationCoordinator: Coordinator
    
//    lazy var testButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.configuration = .filled()
//        button.configuration?.baseBackgroundColor = .systemPink
//        button.configuration?.title = "Add Power"
//        button.addTarget(self, action: #selector(testAction), for: .touchUpInside)
//        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        return button
//    }()
    
    @objc func testAction() {
        gameplayVM.powers.addPowers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isUserInteractionEnabled = false
        
        gameplayVM.controller = self
        gameplayVM.multiVM = multiVM
        gameplayVM.starCombine()
        gameplayVM.configTimeMatch()
        setupView()
        gameplayVM.timerStart.sizeIncrease()
        
//        view.addSubview(testButton)
//        testButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
