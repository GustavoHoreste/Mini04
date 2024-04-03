//
//  SingleViewModel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 22/03/24.
//

import Foundation
import UIKit
import CoreImage

class SingleViewModel: NSObject {
    
    var controller: SingleViewController?
    
//    var camera: CameraModel!
    var items = ItemsToFindModel()
    var model = MlModel()
    
    var objectName = ObjectName()
    var changeButton = ChangeButton()
    var changeCount = ChangeCountLabel()
    var photoButton = PhotoButton()
    var cameraImage = CameraImageView()
    var pontos = PontosLabel()
    var round = RoundLabel()
    var timerRound = TimerSingleRound()
    var timerObject = TimerObject()
    var crosshair = CrosshairImage()
    var logo = LogoImage(isIncreased: false)
    var timerStart = TimerStart()
    var fadeBackground = BackgroundFade()
    
    var pointsMold = AnyImageView(imagem: UIImage(named: "PntsMold"))
    var roundMold = AnyImageView(imagem: UIImage(named: "PntsMold"))
    var timerObjMold = AnyImageView(imagem: UIImage(named: "TimerObjMold"))
    var nameObjMold = AnyImageView(imagem: UIImage(named: "NameObjMold"))
    
    var context: CIContext = CIContext()
    
    override init() {
        super.init()
        setupDelegate()
        
        round.text = "Tempo"
    }
}
