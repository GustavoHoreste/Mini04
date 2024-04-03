//
//  SpecialObjectLabel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import UIKit

class SpecialObjectLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 24) else {fatalError()}
        
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        textColor = .label
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
