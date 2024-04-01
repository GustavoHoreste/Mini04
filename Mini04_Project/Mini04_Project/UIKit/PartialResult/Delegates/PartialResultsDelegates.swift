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
            witchLabel()
            sendUserStatus()
        }else{
            let alertController = UIAlertController(title: "Você já deu ready", message: "Você já realizou esta ação anteriormente.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)

            view.present(alertController, animated: true, completion: nil)

        }
    }
    
    private func witchLabel(){
        if view.multiVM.localPlayer?.isHost == false{
            self.readyButton.setTitle("Preparado?", for: .normal)
            return
        }
        self.readyButton.setTitle("Start", for: .normal)
    }
    
    private func sendUserStatus(){
        print("E para essa valor ser 0 e false pois ja deveriater reiniciado os pontos: \(String(describing: view.multiVM.localPlayer?.userName) ) \(String(describing: view.multiVM.localPlayer?.points) ) - \(String(describing: view.multiVM.localPlayer?.statusUser))")
        
        if view.multiVM.localPlayer?.isHost == false{
            self.view.multiVM.sendLocalUserStatus()
        }
        
        if view.multiVM.validateAllUsersStarted(){
            self.view.multiVM.sendLocalUserStatus()
        }else{
            let alertController = UIAlertController(title: "Jogadores não preparados", message: "Para começar o jogo, todos devem estar prontos.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)

            view.present(alertController, animated: true, completion: nil)
        }
    }
}
