//
//  FeedbackGreen.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 12/04/24.
//

import UIKit

enum FeedbackTypes {
    case red
    case yellow
    case green
}

class FeedbackGreen: UIImageView {

    var isFeedbackAnimating = false
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        alpha = 0
        
    }
    
    func animateAppear(type: FeedbackTypes) {
        //Esse guard é para evitar da animação acontecer enquanto outra da mesma também esteja acontecendo
        guard !isFeedbackAnimating else {
            layer.removeAllAnimations()
            alpha = 0
            isFeedbackAnimating = false
            animateAppear(type: type)
            return
        }
        
        let feedback = [
            FeedbackTypes.green: UIImage(resource: .feedbackGreen),
            FeedbackTypes.yellow: UIImage(resource: .feedbackYellow),
            FeedbackTypes.red: UIImage(resource: .feedbackRed)
        ][type, default: UIImage(resource: .feedbackYellow)]
        
        self.isFeedbackAnimating = true
        image = feedback
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
