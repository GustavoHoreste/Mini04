//
//  PreSingleViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 22/03/24.
//

import UIKit

class PreSingleViewController: UIViewController {

    var navigationCoordinator: Coordinator
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            let gameplay = SingleViewController(navigationCoordinator: self.navigationCoordinator)
            
            if let navigationController = self.navigationController {
                navigationController.pushViewController(gameplay, animated: false)
            }
        }
    }
    
    init(navigationCoordinator: Coordinator) {
        self.navigationCoordinator = navigationCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
