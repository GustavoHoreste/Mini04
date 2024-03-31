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
    
    var notificationCenter = NotificationCenter.default
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemRed
        button.configuration?.title = "Subtract"
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(acao), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return button
    }()
    
    @objc func acao() {
//        gameplayVM.multiVM?.localPlayer?.points -= 1
//        gameplayVM.upadatePoint((multiVM.localPlayer!.points))
//        gameplayVM.pontos.plusAnimate(color: .red)
        gameplayVM.powers.addPowers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        
        gameplayVM.controller = self
        gameplayVM.multiVM = multiVM
        gameplayVM.configMatch()
        gameplayVM.starCombine()
        setupView()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
    
    @objc func appMovedToBackground() {
        print("App foi pro background")
        multiVM.invalidateGroupSession()
        notificationCenter.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
        gameplayVM.timerRound.timer.invalidate()
        gameplayVM.timerObject.timer.invalidate()
        multiVM.hostIsStarter = false
        navigationCoordinator.push(.menu)
        navigationController?.viewControllers.removeAll()
    }
    
}
