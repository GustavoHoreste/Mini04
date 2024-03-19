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
            text = "\(number)"
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 15, weight: .regular)
        text = "0"
        textColor = .label
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
