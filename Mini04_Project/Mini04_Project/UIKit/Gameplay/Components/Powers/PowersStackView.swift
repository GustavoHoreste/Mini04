//
//  PowersStackView.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 19/03/24.
//

import UIKit

class PowersStackView: UIStackView {

    lazy var freeze = PowersButton(imagem: UIImage(systemName: "1.circle.fill")!, power: .freeze)
    lazy var change = PowersButton(imagem: UIImage(systemName: "2.circle.fill")!, power: .change)
    lazy var subtract = PowersButton(imagem: UIImage(systemName: "3.circle.fill")!, power: .subtract)
    lazy var switcher = PowersButton(imagem: UIImage(systemName: "4.circle.fill")!, power: .switcher)
    lazy var shuffle = PowersButton(imagem: UIImage(systemName: "5.circle.fill")!, power: .shuffle)
    
    lazy var allPowers: [PowersButton] = [freeze, change, subtract, switcher, shuffle]
    
    var numberOfPowers = 0
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .horizontal
    }
    
    func addPowers
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
