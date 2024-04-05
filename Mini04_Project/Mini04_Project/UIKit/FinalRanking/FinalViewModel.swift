//
//  FinalViewModel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import Foundation
import UIKit

class FinalViewModel {
    
    var data: [Player] = []
    var dataForCollection:[Player]{
        get{
            var data = self.data
            
            if self.data.count > 3{
                data.removeFirst(3)
            }
            
            return data
        }
    }
    var topPlayers: [Player]{
        get{
            var data:[Player] = []
            
            if self.data.count >= 3{
                for i in stride(from: 0, to: 2, by: 1){
                    data.append(self.data[i])
                }
            }else {
                data = self.data
            }
            
            return data
        }
    }
    var view: FinalRakingViewController?
    
    var podio = AnyImageView(imagem: UIImage(named: "FinalPodio"))
    var tops = AnyImageView(imagem: UIImage(named: "FinalTops"))
    var userFirst = UserImageView(distancia: 170)
    var userSecond = UserImageView(distancia: 125)
    var userThird = UserImageView(distancia: 80)
    var recomecar = SingleRecButton()
    var background = AnyImageView(imagem: UIImage(named: "FinalBackground"))
    lazy var leave = ExitButton()
    lazy var popUp: PopUpExitGame = {
        let view = PopUpExitGame()
        view.modalPresentationStyle = .overFullScreen
        return view
    }()
    
    init() {
        setupDelegates()
    }
    
    func setupTopRanks() {
        switch topPlayers.count{
        case 3:
            userFirst.nameUser.text = topPlayers[0].userName
            userFirst.pointsUser.text = String(topPlayers[0].points)
            
            userSecond.nameUser.text = topPlayers[1].userName
            userSecond.pointsUser.text = String(topPlayers[1].points)
            
            userThird.nameUser.text = topPlayers[2].userName
            userThird.pointsUser.text = String(topPlayers[2].points)
            
        case 2:
            userFirst.nameUser.text = topPlayers[0].userName
            userFirst.pointsUser.text = String(topPlayers[0].points)
            
            userSecond.nameUser.text = topPlayers[1].userName
            userSecond.pointsUser.text = String(topPlayers[1].points)
            
        case 1:
            userFirst.nameUser.text = topPlayers[0].userName
            userFirst.pointsUser.text = String(topPlayers[0].points)
            
        default:
            print("Erros nos tops finais da partida")
        }
    }
}
