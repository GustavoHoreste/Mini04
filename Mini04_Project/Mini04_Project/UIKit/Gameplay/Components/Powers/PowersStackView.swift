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

class PowersStackView: UIStackView {
    
    weak var delegate: PowersStackViewDelegate?

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
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
        alignment = .center
        spacing = 20
    }
    
    func addPowers() {
        if numberOfPowers < 2 {
            var power = allPowers.filter{!usersPowers.contains($0)}.randomElement()!
            power.alpha = 0
            usersPowers.append(power)
            addArrangedSubview(usersPowers.last!)
            delegate?.animatePower(imagem: usersPowers.last?.currentBackgroundImage, power: usersPowers.last?.powerType)
        }
    }
    
    func removePower(powerType: PowerUps) {
        for power in usersPowers {
            if power.powerType == powerType {
                usersPowers.removeAll(where: {$0 == power})
                removeArrangedSubview(power)
                power.removeFromSuperview()
            }
        }
    }
    
    func freezePower() {
        freezeIsOn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.freezeIsOn = false
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
