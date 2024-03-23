//
//  PartialResultsDelegate.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 21/03/24.
//

import UIKit

extension PartialResultViewModel {
    func setupDelegates() {
        self.endGameButton.delegate = self
        self.readyButton.delegate = self
    }
}

extension PartialResultViewModel: EndgameButtonDelegate {
    func endGame() {
        print("Button pressed")
    }
}

//MARK: - funcao do butao de ready
extension PartialResultViewModel: ReadyButtonDelegate {
    func ready() {
        self.readyButton.setTitle("Ready", for: .normal)
        view.applySnapshot(players: self.data.sorted(by: {$0.points > $1.points}))
    }
}
