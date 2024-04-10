//
//  RecordViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import UIKit

class RecordViewController: UIViewController {

    var recordVM = RecordViewModel()
    var navigationCoordinator: Coordinator

    override func viewDidLoad() {
        super.viewDidLoad()

        recordVM.controller = self
        
        setupView()
        
        recordVM.highscore.verifyHighScore(points: recordVM.results.qntd)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){ [self] in
            recordVM.logo.sizeDecrease()
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
