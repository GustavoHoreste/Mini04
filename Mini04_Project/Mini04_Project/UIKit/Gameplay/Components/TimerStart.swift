//
//  TimerStart.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 01/04/24.
//

import UIKit

protocol TimerStartDelegate: AnyObject {
    func timerStartOver()
}

class TimerStart: UIImageView {

    var delegate: TimerStartDelegate?
    
    var count: Int = 0
    
    var images: [UIImage?] = [UIImage(named: "Count3"), UIImage(named: "Count2"), UIImage(named: "Count1"), UIImage(named: "CountJa")]
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sizeIncrease() {
        print("\(count)")
        image = images[count]
        count += 1
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(scaleX: 3, y: 3)
        }, completion: { [self] _ in
            if count == 4 {
                delegate?.timerStartOver()
                removeFromSuperview()
                return
            }
            sizeDecrease()
        })
    }
    
    func sizeDecrease() {
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(scaleX: 0.33, y: 0.33)
        }, completion: { _ in
            self.sizeIncrease()
        })
    }

}
