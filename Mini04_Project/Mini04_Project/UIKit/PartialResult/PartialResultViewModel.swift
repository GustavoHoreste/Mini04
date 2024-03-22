//
//  PartialResultViewModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 21/03/24.
//

import Foundation

class PartialResultViewModel {
    
    lazy var endGameButton = EndGameButton()
    lazy var partialResultsTitle = PartialResultTitle()
    lazy var readyButton = ReadyButton()
    
    init() {
        setupDelegates()
    }
}
