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
    var haptics = Haptics()
    
    lazy var endGameButton = EndGameButton()
    lazy var partialResultsTitle = PartialResultTitle()
    lazy var readyButton = ReadyButton()
    lazy var logo = LogoImage(isIncreased: true, altura: view.view.frame.height)
    lazy var exit = ExitButton()
    lazy var timerBeforeButtonReady: TimerBeforeButtonReady = {
        let view = TimerBeforeButtonReady()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backGroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fundoGeral")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy var popUpExitVC: PopUpExitGame = {
        let view = PopUpExitGame()
        view.modalPresentationStyle = .overFullScreen
        return view
    }()
    
    private var cancellables = Set<AnyCancellable>()
    private var newFinishGame: FinishGame?{
        didSet{
            if newFinishGame?.status == true{
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
    }
    
    
    private func nextRound(){
        self.haptics.doHaptic(type: .button)
        self.view.gameplayVM.fadeBackground.isHidden = false
        self.view.gameplayVM.timerStart.sizeIncrease()
        self.view.navigationController?.popViewController(animated: true)
    }
    
    public func funcStartCombine(){ 
        self.view.multiVM.$newFinishGame
            .assign(to: \.newFinishGame, on: self)
            .store(in: &cancellables)
        
        self.view.multiVM.$hostIsStarter
            .assign(to: \.hostIsStarter, on: self)
            .store(in: &cancellables)
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
    
    public func backLobby(){
        cancellables.removeAll()
        
        DispatchQueue.main.async {
            self.view?.multiVM.countReadyGame = false
            self.view?.multiVM.newFinishGame = nil
            self.view.multiVM.newGame()
            self.view.navigationCoordinator.push(.lobby)
        }
   }
}
