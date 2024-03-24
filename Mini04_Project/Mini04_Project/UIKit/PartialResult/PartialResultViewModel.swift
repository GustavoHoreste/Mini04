//
//  PartialResultViewModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 21/03/24.
//

import Foundation

class PartialResultViewModel {
    
    var view:PartialResultViewController!
    
    var data: [Player] = []
    
    lazy var endGameButton = EndGameButton()
    lazy var partialResultsTitle = PartialResultTitle()
    lazy var readyButton = ReadyButton()
    lazy var logo = LogoImage(isIncreased: true)
    
    init() {
        setupDelegates()
        logo.sizeDecrease()
    }
}
