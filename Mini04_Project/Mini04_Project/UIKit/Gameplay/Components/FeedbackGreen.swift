//
//  FeedbackGreen.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 12/04/24.
//

import UIKit

class FeedbackGreen: UIImageView {

    var isFeedbackAnimating = false
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        alpha = 0
        
    }
    
    func animateAppear(isGreen: Bool) {
        guard !isFeedbackAnimating else {
            layer.removeAllAnimations()
            alpha = 0
            isFeedbackAnimating = false
            animateAppear(isGreen: isGreen)
            return
        }
        self.isFeedbackAnimating = true
        image = isGreen ? UIImage(resource: .feedbackGreen) : UIImage(resource: .feedbackRed)
        UIView.animate(withDuration: 0.8, animations: {
            self.alpha = 1
        }){ _ in
            UIView.animate(withDuration: 0.8, animations: {
                self.alpha = 0
            }){ _ in
                self.isFeedbackAnimating = false
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
