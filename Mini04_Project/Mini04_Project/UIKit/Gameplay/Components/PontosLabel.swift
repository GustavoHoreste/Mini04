//
//  PontosLabel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import UIKit

class PontosLabel: UILabel {

    var number = 0 {
        didSet {
            DispatchQueue.main.async {
                self.text = "\(self.number) pts"
            }
        }
    }
    
    var isPlusAnimating = false
    
    init() {
        super.init(frame: .zero)
        
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 24) else {fatalError()}

        translatesAutoresizingMaskIntoConstraints = false
        font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        text = "0 pts"
        textColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func plusAnimate(color: UIColor) {
        guard !isPlusAnimating else {
            layer.removeAllAnimations()
            transform = .identity
            textColor = color
            isPlusAnimating = false
            plusAnimate(color: color)
            return
        }
        isPlusAnimating = true
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.textColor = color
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.transform = .identity
                self.textColor = .black
            }) { _ in
                self.isPlusAnimating = false
            }
            
        }
    }
    
}
