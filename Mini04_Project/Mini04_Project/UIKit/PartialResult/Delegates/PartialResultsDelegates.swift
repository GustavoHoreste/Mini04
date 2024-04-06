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
        self.exit.delegate = self
        self.popUpExitVC.delegate = self
    }
}

extension PartialResultViewModel: EndgameButtonDelegate {
    func endGame() {
        print("terminar partida")
        self.view.multiVM.sendHostFinish()
        self.view.navigationCoordinator.push(.lobby)
    }
}

extension PartialResultViewModel: ExitGameDelegate{
    func didTabButtun(_ tab: Int) {
        switch tab{
        case 1:
            self.anitionDismiss()
        case 0:
            self.anitionDismiss()
            self.view.navigationCoordinator.push(.menu)
        default:
            print("Tag invalid")
        }
    }
    
    func exitGame() {
        self.haptics.doHaptic(type: .button)
        self.view.present(popUpExitVC, animated: false)
    }
    
    
    func anitionDismiss(){
        UIView.animate(withDuration: 1, delay: 0.0,options: .curveEaseOut) {
            
        }completion: { _ in
            self.view.dismiss(animated: false)
        }
    }
}

//MARK: - funcao do butao de ready
extension PartialResultViewModel: ReadyButtonDelegate {
    func ready() {
        if view.multiVM.localPlayer?.statusUser == false{
            self.haptics.doHaptic(type: .button)
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
            self.haptics.doHaptic(type: .button)
            self.view.multiVM.sendLocalUserStatus()
            self.view.gameplayVM.timerStart.sizeIncrease()
            self.view.navigationController?.popViewController(animated: true)
        }else{
            let alertController = UIAlertController(title: "Jogadores não preparados", message: "Para começar o jogo, todos devem estar prontos.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)

            view.present(alertController, animated: true, completion: nil)
        }
    }
}
