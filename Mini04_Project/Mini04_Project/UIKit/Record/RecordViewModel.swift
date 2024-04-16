//
//  RecordViewModel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import Foundation
import UIKit

class RecordViewModel {
        
    weak var controller: RecordViewController?
    
    var haptics = Haptics()
    var results = SingleResultLabel()
    var highscore = HighscoreLabel()
    var menu = ResultMenuButton()
    lazy var logo = LogoImage(isIncreased: true, altura: controller?.view.frame.height)
//    var restart = SingleRecButton()
    
    var background = AnyImageView(imagem: UIImage(resource: .backgroundClaro))
    var scoreMold = AnyImageView(imagem: UIImage(named: "SingleScoreMold"))
    
    init() {
        setupDelegate()
    }
    
}
