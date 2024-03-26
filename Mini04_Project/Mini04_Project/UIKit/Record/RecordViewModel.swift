//
//  RecordViewModel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import Foundation

class RecordViewModel {
        
    lazy var results = SingleResultLabel()
    lazy var highscore = HighscoreLabel()
    lazy var menu = ResultMenuButton()
    lazy var logo = LogoImage(isIncreased: true)
    
    init() {
        logo.sizeDecrease()
    }
    
}
