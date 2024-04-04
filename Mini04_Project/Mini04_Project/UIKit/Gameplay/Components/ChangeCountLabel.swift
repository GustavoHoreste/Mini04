//
//  ChangeCountLabel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 31/03/24.
//

import UIKit

protocol ChangeCountLabelDelegate: AnyObject {
    func countEnded()
}

class ChangeCountLabel: UILabel {

    weak var delegate: ChangeCountLabelDelegate?
    
    var number = 3 {
        didSet {
            DispatchQueue.main.async {
                self.text = "\(self.number)"
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 18) else {fatalError()}
        
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        textColor = .black
        text = "3"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subtractCount() {
        if number >= 1 {
            number -= 1
        }
        verifyCount()
    }
    
    func verifyCount() {
        if number == 0 {
            alpha = 0.3
            delegate?.countEnded()
        }
    }
    
}
