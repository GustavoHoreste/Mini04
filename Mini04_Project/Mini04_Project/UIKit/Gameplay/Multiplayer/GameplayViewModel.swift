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
    
    var controller: GameplayViewController?
    var multiVM: MultiplayerManagerViewModel?
    
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
    lazy var special = SpecialObjectImage()
    lazy var timerRound = TimerRound()
    lazy var timerObject = TimerObject()
    lazy var powers = PowersStackView()
    lazy var crosshair = CrosshairImage()
    lazy var logo = LogoImage(isIncreased: false)
    
    var context: CIContext = CIContext()
    
    override init() {
        super.init()
        setupDelegate()
        
        objectName.text = items.toFindObject
        special.specialName.text = items.specialObject
    }
    
    
    
}


