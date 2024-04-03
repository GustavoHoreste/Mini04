//
//  SingleViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 22/03/24.
//

import UIKit

class SingleViewController: UIViewController {

    var gameplayVM = SingleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameplayVM.controller = self
        
        view.isUserInteractionEnabled = false
        
        setupView()
        gameplayVM.timerStart.sizeIncrease()
    }
}
