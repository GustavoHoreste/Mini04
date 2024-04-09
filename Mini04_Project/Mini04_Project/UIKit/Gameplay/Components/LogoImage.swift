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
        image = UIImage(named: "logo2")
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 1024/4),
            heightAnchor.constraint(equalToConstant: 1024/4)
        ])
        
        if isIncreased {
            isHidden = false
            self.transform = CGAffineTransform(scaleX: 10, y: 10).concatenating(CGAffineTransform(rotationAngle: -CGFloat.pi / 4))
        }else {
            isHidden = true
            self.transform = CGAffineTransform(scaleX: 0.1, y: 0.01).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi / 4))
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sizeDecrease() {
        let rad: Double = atan2( Double(transform.b), Double(transform.a))
        let deg: CGFloat = CGFloat(rad) * (CGFloat(180) / CGFloat.pi )
        print(deg)
        self.isHidden = false
        UIView.animate(withDuration: 1.5, animations: {
            self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi / 8))
        }, completion: { _ in
            self.isHidden = true
            self.resetAnimationPartial()
        })
    }
    
    func resetAnimationPartial() {
        self.transform = CGAffineTransform(scaleX: 10, y: 10).concatenating(CGAffineTransform(rotationAngle: -CGFloat.pi / 4))
    }
    
    func resetAnimationGameplay() {
        self.transform = CGAffineTransform(scaleX: 0.05, y: 0.05).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi / 8))
    }
    
}
