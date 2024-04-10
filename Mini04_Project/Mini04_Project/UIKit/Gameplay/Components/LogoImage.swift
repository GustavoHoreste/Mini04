//
//  LogoImage.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 21/03/24.
//

import UIKit

class LogoImage: UIImageView {
    
    var altura: CGFloat?
    
    init(isIncreased: Bool, altura: CGFloat?) {
        self.altura = altura
        
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "bonequinho")
        
        if isIncreased {
            isHidden = false
//            center.y -= (altura! + altura! * 0.3)
        }else {
            isHidden = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sizeDecrease() {
        isHidden = false
        translatesAutoresizingMaskIntoConstraints = true
        UIView.animate(withDuration: 2.0, animations: {
            self.center.y += (self.altura! + self.altura! * 0.4)
        }, completion: { _ in
            self.isHidden = true
            self.center.y -= (self.altura! + self.altura! * 0.4)
        })
    }
    
    func resetAnimationGameplay() {
        center.y += (altura! + altura! * 0.4)
    }
    
}
