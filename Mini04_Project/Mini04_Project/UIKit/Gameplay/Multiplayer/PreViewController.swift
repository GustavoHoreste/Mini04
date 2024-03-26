//
//  PreViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 21/03/24.
//

import UIKit

class PreViewController: UIViewController {
    
    var multiVM: MultiplayerManagerViewModel
    var navigationCoordinator: Coordinator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let gameplay = GameplayViewController(multiVM: multiVM, navigationCoordinator: navigationCoordinator)
            
            if let navigationController = self.navigationController {
                navigationController.pushViewController(gameplay, animated: false)
            }
        }
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
