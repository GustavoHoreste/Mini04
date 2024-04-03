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
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemRed
        button.configuration?.title = "Add Power"
        button.configuration?.titleAlignment = .center
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(acao), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        button.isHidden = true
        return button
    }()
    
    @objc func acao() {
        //Testar subtract
//        gameplayVM.multiVM?.localPlayer?.points -= 1
//        gameplayVM.upadatePoint((multiVM.localPlayer!.points))
//        gameplayVM.pontos.plusAnimate(color: .red)
        
        //Testar poderzinhos
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
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 130),
        ])
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
