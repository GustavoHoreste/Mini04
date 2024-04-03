//
//  RoundLabel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import UIKit

class RoundLabel: UILabel {
    
    var number = 1 {
        didSet {
            text = "Round \(number)"
            print("Round atual: \(number)")
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        guard let customFont = UIFont(name: "FafoSans-Regular", size: 24) else {fatalError()}
        
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 15, weight: .regular)
        font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        textColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
