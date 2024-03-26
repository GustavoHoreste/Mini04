//
//  RecordViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import UIKit

class RecordViewController: UIViewController {

    var recordVM = RecordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        recordVM.highscore.verifyHighScore(points: recordVM.results.qntd)
    }
    
}
