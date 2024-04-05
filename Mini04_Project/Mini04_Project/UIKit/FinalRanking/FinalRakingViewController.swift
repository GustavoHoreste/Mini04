//
//  FinalRakingViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import UIKit

class FinalRakingViewController: UIViewController {

    var navigationCoordinator: Coordinator
    var finalVM = FinalViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalVM.view = self
        
        setupView()
    }

    init(navigationCoordinator: Coordinator){
        self.navigationCoordinator = navigationCoordinator
        super.init(nibName: nil, bundle: nil)    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
