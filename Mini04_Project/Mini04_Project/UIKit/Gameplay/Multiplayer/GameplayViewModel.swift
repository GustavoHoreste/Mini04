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
    
    //MARK: - Camera
    var camera: CameraModel!
    var items = ItemsToFindModel()
    var model = MlModel()
    
    var objectName = ObjectName()
    var changeButton = ChangeButton()
    var changeCount = ChangeCountLabel()
    var photoButton = PhotoButton()
    var cameraImage = CameraImageView()
    var pontos = PontosLabel()
    var round = RoundLabel()
    var special = SpecialObjectImage()
    var timerRound = TimerRound()
    var timerObject = TimerObject()
    var powers = PowersStackView()
    var crosshair = CrosshairImage()
    var logo = LogoImage(isIncreased: false)
    var timerStart = TimerStart()
    var fadeBackground = BackgroundFade()
    var alert = AlertPowerView(icon: UIImage(), name: "")

    var pointsMold = AnyImageView(imagem: UIImage(named: "PntsMold"))
    var roundMold = AnyImageView(imagem: UIImage(named: "PntsMold"))
    var timerObjMold = AnyImageView(imagem: UIImage(named: "TimerObjMold"))
    var nameObjMold = AnyImageView(imagem: UIImage(named: "NameObjMold"))
    
    var context: CIContext = CIContext()
    
    private var cancellables = Set<AnyCancellable>()
    private var startHidrance: PowerUps?{
        didSet{
            if startHidrance != nil{
                reciveHidrance(powerType: startHidrance!)
                startHidrance = nil
            }
        }
    }
    private var newEspecialObj: SpecialObject?{
        didSet{
            if newEspecialObj != nil{
                verifyNewWord(newEspecialObj)
                newEspecialObj = nil
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
         if multiVM?.configMatch.powerUps == true {
             if multiVM?.localPlayer?.isHost == true{
                 items.chooseSpecialObject()
                 let specialObject = SpecialObject(objectName: items.specialObject, isHit: false)
                 self.multiVM?.newEspecialObj = specialObject
                 self.multiVM?.sendEspcialObject(specialObject)
             }
         }
         
         if multiVM?.configMatch.coresIsChoise == true {
             items.setColors()
         }
         
         items.chooseObject()
         objectName.text = items.toFindObject
    }
    
    public func configTimeMatch(){
        guard let config = multiVM?.configMatch else {
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


