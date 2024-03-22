//
//  LogoImage.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 21/03/24.
//

import UIKit

class LogoImage: UIImageView {
    
    init(isIncreased: Bool) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "imageActivityGroup")
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 10),
            heightAnchor.constraint(equalToConstant: 10),
        ])
        
        if isIncreased {
            isHidden = false
            transform = CGAffineTransform(scaleX: 100.0, y: 100.0)
        }else {
            isHidden = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sizeDecrease() {
        UIView.animate(withDuration: 3.0, animations: {
            self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
    
}
