//
//  GameplayViewModel.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 18/03/24.
//

import Foundation
import UIKit
import CoreImage
import Combine

class GameplayViewModel: NSObject {
    
    var controller: GameplayViewController?
    //Nao precisa dessa varivel pois a controller ja tem uma referencia de multiVM e esse view tem a referencia da controller
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
    
    private var cancellables = Set<AnyCancellable>()
    private var startHidrance: PowerUps?{
        didSet{
            if startHidrance != nil{
                reciveHidrance(powerType: startHidrance!)
            }
        }
    }
    
    override init() {
        super.init()
        setupDelegate()
        
        objectName.text = items.toFindObject
        
    }
    
     public func starCombine(){
        controller?.multiVM.$starActionHidrance
            .assign(to: \.startHidrance, on: self)
            .store(in: &cancellables)
    }
    
     public func configMatch(){
         self.configTimeMatch()
         
         if multiVM?.configMatch.powerUps == true {
             items.chooseSpecialObject()
             special.specialName.text = items.specialObject
         }
         
         if multiVM?.configMatch.coresIsChoise == true {
             items.setColors()
         }
         
//         items.chooseObject()
    }
    
    private func configTimeMatch(){
        guard let config = multiVM?.configMatch else {
            print("sai do configMatch da GamePlayViewModel: \(String(describing: multiVM?.configMatch))")
            return
        }
        
        let timerRound = config.roundTime
        self.timerRound.config(timerRound)
    }
    
//    private func
    
}


