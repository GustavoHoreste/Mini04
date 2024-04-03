//
//  BackgroundFade.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 01/04/24.
//

import UIKit

class BackgroundFade: UIView {

    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        alpha = 0.8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
