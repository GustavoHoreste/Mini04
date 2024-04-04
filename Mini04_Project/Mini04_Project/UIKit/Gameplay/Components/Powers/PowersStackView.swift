//
//  PowersStackView.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 19/03/24.
//

import UIKit

protocol PowersStackViewDelegate: AnyObject {
    func animatePower(imagem: UIImage?, power: PowerUps?)
}

class PowersStackView: UIImageView {
    
    weak var delegate: PowersStackViewDelegate?
    
    var powerMold1 = AnyImageView(imagem: UIImage(named: "PowersMold"))
    var powerMold2 = AnyImageView(imagem: UIImage(named: "PowersMold"))

    lazy var freeze = PowersButton(imagem: UIImage(systemName: "1.circle.fill")!, power: .freeze)
    lazy var switcher = PowersButton(imagem: UIImage(systemName: "2.circle.fill")!, power: .switchWord)
    lazy var subtract = PowersButton(imagem: UIImage(systemName: "3.circle.fill")!, power: .subtrac)
    lazy var change = PowersButton(imagem: UIImage(systemName: "4.circle.fill")!, power: .changeCamera)
    lazy var shuffle = PowersButton(imagem: UIImage(systemName: "5.circle.fill")!, power: .shuffleWord)
    
    lazy var allPowers: [PowersButton] = [freeze, change, subtract, switcher, shuffle]
    
    var usersPowers: [PowersButton] = [] {
        didSet {
            numberOfPowers = usersPowers.count
        }
    }
    var numberOfPowers = 0
    var freezeIsOn = false
    var firstMold: PowerUps? = nil
    var secondMold: PowerUps? = nil
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        
        image = UIImage(named: "PowersStackMold")
        
        addSubview(powerMold1)
        addSubview(powerMold2)
        
        NSLayoutConstraint.activate([
            powerMold1.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30),
            powerMold1.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            powerMold2.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30),
            powerMold2.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 80),
        ])
    }
    
    func addPowers() {
        if numberOfPowers < 2 {
            let power = allPowers.filter{!usersPowers.contains($0)}.randomElement()!
            power.alpha = 0
            usersPowers.append(power)
            putPowerInMold(power: power)
            delegate?.animatePower(imagem: power.currentBackgroundImage, power: power.powerType)
            holdPowerType(type: power.powerType)
        }
    }
    
    func removePower(powerType: PowerUps) {
        for power in usersPowers {
            if power.powerType == powerType {
                usersPowers.removeAll(where: {$0 == power})
                power.removeFromSuperview()
            }
        }
        if powerType == firstMold {
            firstMold = nil
        }
        else if powerType == secondMold {
            secondMold = nil
        }else {
            print("DEU RUIM NO REMOVEPOWER")
        }
    }
    
    func freezePower() {
        freezeIsOn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.freezeIsOn = false
        }
    }
    
    func holdPowerType(type: PowerUps?) {
        if firstMold == nil {
            firstMold = type
            return
        }
        secondMold = type
    }
    
    func putPowerInMold(power: PowersButton) {
        switch numberOfPowers {
        case 1:
            addSubview(power)
            power.centerXAnchor.constraint(equalTo: powerMold1.centerXAnchor).isActive = true
            power.centerYAnchor.constraint(equalTo: powerMold1.centerYAnchor).isActive = true
        case 2:
            addSubview(power)
            power.centerXAnchor.constraint(equalTo: powerMold2.centerXAnchor).isActive = true
            power.centerYAnchor.constraint(equalTo: powerMold2.centerYAnchor).isActive = true
        default:
            print("Nao colocou o poder no Mold")
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
