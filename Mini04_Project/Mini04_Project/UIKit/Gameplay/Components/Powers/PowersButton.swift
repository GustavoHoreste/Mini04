//
//  PowersButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 19/03/24.
//

import UIKit

protocol PowersButtonDelegate: AnyObject {
    func powerButtonAction()
}

class PowersButton: UIButton {

    weak var delegate: PowersButtonDelegate?
    
    var power: PowersTypes?
    
    init(imagem: UIImage, power: PowersTypes) {
        super.init(frame: .zero)
        
        self.power = power
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setBackgroundImage(imagem, for: .normal)
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        delegate?.powerButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
