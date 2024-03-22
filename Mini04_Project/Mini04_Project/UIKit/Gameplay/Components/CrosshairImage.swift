//
//  CrosshairImage.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 21/03/24.
//

import UIKit

class CrosshairImage: UIImageView {

    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(systemName: "plus")
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 15),
            heightAnchor.constraint(equalToConstant: 15),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
