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
    lazy var changeCount = ChangeCountLabel()
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
    private var newEspecialObj: SpecialObject?{
        didSet{
            if newEspecialObj != nil{
                verifyNewWord(newEspecialObj)
            }
        }
    }
    
    override init() {
        super.init()
        setupDelegate()
    }
    
     public func starCombine(){
        controller?.multiVM.$starActionHidrance
            .assign(to: \.startHidrance, on: self)
            .store(in: &cancellables)
         
         controller?.multiVM.$newEspecialObj
             .assign(to: \.newEspecialObj, on: self)
             .store(in: &cancellables)
    }
    
     public func configMatch(){
         self.configTimeMatch()
         
         if multiVM?.configMatch.powerUps == true {
             if multiVM?.localPlayer?.isHost == true{
                 items.chooseSpecialObject()
                 let specialObject = SpecialObject(objectName: items.specialObject, isHit: false)
                 self.multiVM?.newEspecialObj = specialObject
                 self.multiVM?.sendEspcialObject(specialObject)
             }
             print(self.multiVM?.newEspecialObj as Any)
         }
         
         if multiVM?.configMatch.coresIsChoise == true {
             items.setColors()
         }
         
         items.chooseObject()
         objectName.text = items.toFindObject
    }
    
    private func configTimeMatch(){
        guard let config = multiVM?.configMatch else {
            print("sai do configMatch da GamePlayViewModel: \(String(describing: multiVM?.configMatch))")
            return
        }
        
        let timerRound = config.roundTime
        self.timerRound.config(timerRound)
    }
    
    private func verifyNewWord(_ value: SpecialObject?){
        guard let valueNotOpcional = value else {return}
        DispatchQueue.main.async { [self] in
            print("acertou? \(String(describing: value))")
            special.specialName.text = valueNotOpcional.objectName
            items.specialObject = valueNotOpcional.objectName
            if valueNotOpcional.isHit{
                special.specialFinded()
            }
        }
    }
}


