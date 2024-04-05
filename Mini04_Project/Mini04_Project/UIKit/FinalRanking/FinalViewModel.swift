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
            data.removeFirst(3)
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
}
