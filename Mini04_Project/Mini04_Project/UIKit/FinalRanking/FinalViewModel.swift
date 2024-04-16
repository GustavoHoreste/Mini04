//
//  FinalViewModel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import Foundation
import UIKit
import Combine

class FinalViewModel {
    
    var data: [Player] = []
    
    var dataForCollection:[Player]{
        get{
            var data = self.data
            if self.data.count > 3{
                data.removeFirst(3)
                return data
            }
            return []
        }
    }
    
    var topPlayers: [Player]{
        get{
            var data: [Player] = []
            if self.data.count <= 3{
                data = Array(self.data.prefix(self.data.count))
                return data
            }else {
                data = Array(self.data.prefix(3))
                return data
            }
        }
        
    }
    
    private var newFinishGame: FinishGame?{
        didSet{
            if newFinishGame?.status == true{
                backToHome()
                newFinishGame = nil
            }
        }
    }

    var view: FinalRakingViewController?
    var haptics = Haptics()
    
    private var cancellables = Set<AnyCancellable>()
    
    var podio = AnyImageView(imagem: UIImage(named: "FinalPodio"))
    var tops = AnyImageView(imagem: UIImage(named: "FinalTops"))
    var userFirst = UserImageView(distancia: 170)
    var userSecond = UserImageView(distancia: 125)
    var userThird = UserImageView(distancia: 80)
    var recomecar = SingleRecButton()
    var background = AnyImageView(imagem: UIImage(named: "fundoGeral"))
    lazy var leave = ExitButton()
    
    lazy var popUp: PopUpExitGame = {
        let view = PopUpExitGame()
        view.modalPresentationStyle = .overFullScreen
        return view
    }()
    
    init() {
        setupDelegates()
    }
    
    func starCombine(){
        self.view?.multiVM.$newFinishGame
            .assign(to: \.newFinishGame, on: self)
            .store(in: &cancellables)
    }
    
    func setupTopRanks() {
        switch topPlayers.count{
        case 3:
            userFirst.nameUser.text = topPlayers[0].userName
            userFirst.pointsUser.text = String(topPlayers[0].points)
            userFirst.image = UIImage(named: topPlayers[0].playerImage)
            
            userSecond.nameUser.text = topPlayers[1].userName
            userSecond.pointsUser.text = String(topPlayers[1].points)
            userSecond.image = UIImage(named: topPlayers[1].playerImage)
            
            userThird.nameUser.text = topPlayers[2].userName
            userThird.pointsUser.text = String(topPlayers[2].points)
            userThird.image = UIImage(named: topPlayers[2].playerImage)
        case 2:
            userFirst.nameUser.text = topPlayers[0].userName
            userFirst.pointsUser.text = String(topPlayers[0].points)
            userFirst.image = UIImage(named: topPlayers[0].playerImage)
            
            userSecond.nameUser.text = topPlayers[1].userName
            userSecond.pointsUser.text = String(topPlayers[1].points)
            userSecond.image = UIImage(named: topPlayers[1].playerImage)
            
            self.userThird.isHiden()
        case 1:
            userFirst.nameUser.text = topPlayers[0].userName
            userFirst.pointsUser.text = String(topPlayers[0].points)
            userFirst.image = UIImage(named: topPlayers[0].playerImage)
            
            self.userSecond.isHiden()
            self.userThird.isHiden()
        default:
            print("Erros nos tops finais da partida")
        }
    }
    
    
    //Nao host volta a lobby
    public func backToHome(){
        cancellables.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.view?.multiVM.countReadyGame = false
            self.view?.multiVM.newFinishGame = nil
            self.view?.multiVM.newGame()
            self.view?.navigationCoordinator.push(.lobby)
        }
    }
}
