//
//  FinalViewModel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import Foundation
import UIKit

class FinalViewModel {
    var podio = AnyImageView(imagem: UIImage(named: "FinalPodio"))
    var tops = AnyImageView(imagem: UIImage(named: "FinalTops"))
    var userFirst = UserImageView(distancia: 170)
    var userSecond = UserImageView(distancia: 125)
    var userThird = UserImageView(distancia: 80)
    var leave = ResultMenuButton()
    var recomecar = SingleRecButton()
    var background = AnyImageView(imagem: UIImage(named: "FinalBackground"))
    
    init() {
        setupDelegates()
    }
}
