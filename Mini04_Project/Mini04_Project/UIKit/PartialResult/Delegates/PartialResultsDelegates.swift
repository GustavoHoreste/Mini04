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
        print("terminar partida")
        self.view.multiVM.sendHostFinish()
        self.view.navigationCoordinator.push(.lobby)
    }
}

//MARK: - funcao do butao de ready
extension PartialResultViewModel: ReadyButtonDelegate {
    func ready() {
        if view.multiVM.localPlayer?.statusUser == false{
            sendUserStatus()
        }else{
            let alertController = UIAlertController(title: "Você já deu ready", message: "Você já realizou esta ação anteriormente.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)

            view.present(alertController, animated: true, completion: nil)
        }
    }
    
    private func sendUserStatus(){
        if view.multiVM.localPlayer?.isHost == false{
            self.view.multiVM.sendLocalUserStatus()
            
        } else if view.multiVM.validateAllUsersStarted() && view.multiVM.localPlayer?.isHost == true{
            self.view.multiVM.sendLocalUserStatus()
            
            var nextScreen: GameplayViewController?
            
            if let nextScreenNotOpcional = self.view.gameplayVM.controller{
                 nextScreen = nextScreenNotOpcional
            } else {
                 nextScreen = GameplayViewController(multiVM: self.view.multiVM, navigationCoordinator: self.view.navigationCoordinator)
            }
            
            print("Valor antes de incrementar: \(String(describing: nextScreen?.gameplayVM.round.number)) HOST")
            nextScreen?.gameplayVM.round.number = currentRound + 1
            print("Valor depois de incrementar:\(String(describing: nextScreen?.gameplayVM.round.number)) HOST")

            self.view.navigationController?.pushViewController(nextScreen!, animated: false)
//            self.view.dismiss(animated: true)
//            self.view.navigationController?.dismiss(animated: true)
            
        }else{
            let alertController = UIAlertController(title: "Jogadores não preparados", message: "Para começar o jogo, todos devem estar prontos.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)

            view.present(alertController, animated: true, completion: nil)
        }
    }
}
