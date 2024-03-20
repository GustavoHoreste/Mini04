//
//  PowersButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 19/03/24.
//

import UIKit

protocol PowersButtonDelegate: AnyObject {
    func powerButtonAction(powerType: PowerUps)
}

class PowersButton: UIButton {

    weak var delegate: PowersButtonDelegate?
    
    var powerType: PowerUps?
    
    init(imagem: UIImage, power: PowerUps) {
        super.init(frame: .zero)
        
        self.powerType = power
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setBackgroundImage(imagem, for: .normal)
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func buttonAction() {
        delegate?.powerButtonAction(powerType: powerType!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
