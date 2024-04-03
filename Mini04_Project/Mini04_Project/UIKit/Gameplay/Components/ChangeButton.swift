//
//  ChangeButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import UIKit

protocol ChangeButtonDelegate: AnyObject {
    func changeButtonAction()
}

class ChangeButton: UIButton {
    
    weak var delegate: ChangeButtonDelegate?
    
    let animation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = CGFloat.pi * 2
        animation.toValue = 0
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.repeatCount = 0
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        return animation
    }()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setImage(UIImage(named: "ChangeButton"), for: .normal)
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        delegate?.changeButtonAction()
    }
    
    func rotateAnimate() {
        layer.add(animation, forKey: "rotationAnimation")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
