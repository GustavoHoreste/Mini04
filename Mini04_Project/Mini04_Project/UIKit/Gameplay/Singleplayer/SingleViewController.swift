//
//  SingleViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 22/03/24.
//

import UIKit

class SingleViewController: UIViewController {

    var gameplayVM = SingleViewModel()
    var navigationCoordinator: Coordinator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(navigationController?.viewControllers as Any)
        
        gameplayVM.controller = self
        
        view.isUserInteractionEnabled = false
        
        setupView()
        gameplayVM.timerStart.sizeIncrease()
    }
    
    init(navigationCoordinator: Coordinator) {
        self.navigationCoordinator = navigationCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
