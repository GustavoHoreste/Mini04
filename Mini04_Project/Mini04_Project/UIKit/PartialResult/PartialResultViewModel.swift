//
//  PartialResultViewModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 21/03/24.
//

import UIKit
import Combine


class PartialResultViewModel {
    
    var view: PartialResultViewController!
    
    var data: [Player] = []
    
    var currentRound: Int = 0
    var isFinishGame: Bool = false
    
    lazy var endGameButton = EndGameButton()
    lazy var partialResultsTitle = PartialResultTitle()
    lazy var readyButton = ReadyButton()
    lazy var logo = LogoImage(isIncreased: true)
    
    private var cancellables = Set<AnyCancellable>()
    private var newFinishGame: FinishGame?{
        didSet{
            if newFinishGame != nil{
                backLobby()
                newFinishGame = nil
            }
        }
    }
    
    private var hostIsStarter: Bool = false{
        didSet{
            if hostIsStarter == true{
                nextRound()
                hostIsStarter = false
            }
        }
    }
    
    init() {        
        setupDelegates()
        logo.sizeDecrease()
    }
    
    private func nextRound(){
//        self.cancellables.forEach { $0.cancel() }
        self.view.gameplayVM.round.number += 1
        self.view.dismiss(animated: true)
    }
    
    public func funcStartCombine(){
        self.view.multiVM.$newFinishGame
            .assign(to: \.newFinishGame, on: self)
            .store(in: &cancellables)
        
        self.view.multiVM.$hostIsStarter
            .assign(to: \.hostIsStarter, on: self)
            .store(in: &cancellables)
    }
    
    public func backLobby(){
        self.view.navigationCoordinator.push(.lobby)
    }

    
    public func verifyIsHost(){
        if self.view.multiVM.localPlayer?.isHost == true{
            self.endGameButton.diableButton()
        }
    }
    
    public func cinfigureLabelReadyButton(){
        let userIsHost = self.view.multiVM.localPlayer?.isHost
        self.readyButton.witchLabel(userIsHost!)
    }
}
