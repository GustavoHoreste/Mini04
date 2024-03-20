//
//  GameplayViewModel.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 18/03/24.
//

import Foundation
import UIKit
import CoreImage

class GameplayViewModel: NSObject {
    
    var camera: CameraModel!
    var items = ItemsToFindModel()
    var model = MlModel()
    
    lazy var objectName = ObjectName()
    lazy var changeButton = ChangeButton()
    lazy var photoButton = PhotoButton()
    lazy var cameraImage = CameraImageView()
    lazy var pontos = PontosLabel()
    lazy var profile = ProfileImage()
    lazy var round = RoundLabel()
    lazy var special = SpecialObjectLabel()
    lazy var timerRound = TimerRound(minutos: 2, segundos: 0)
    lazy var timerObject = TimerObject(minutos: 0, segundos: 15)
    lazy var powers = PowersStackView()
    
    var context: CIContext = CIContext()
    
    override init() {
        super.init()
        setupDelegate()
        
        objectName.text = items.toFindObject
        special.text = items.specialObject
    }
    
}


