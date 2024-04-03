//
//  BackgroundGameplay.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 02/04/24.
//

import UIKit

class BackgroundGameplay: UIImageView {
    
    lazy var sideLeft: UIImageView = {
        let side = UIImageView(image: UIImage(named: "SideBackground"))
        side.translatesAutoresizingMaskIntoConstraints = false
        return side
    }()
    
    lazy var sideRight: UIImageView = {
        let side = UIImageView(image: UIImage(named: "SideBackground"))
        side.translatesAutoresizingMaskIntoConstraints = false
        return side
    }()

    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        image = UIImage(named: "GameplayBackground")
        
        addSubview(sideLeft)
        addSubview(sideRight)
        
        NSLayoutConstraint.activate([
            sideLeft.leadingAnchor.constraint(equalTo: leadingAnchor),
            sideLeft.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            sideRight.leadingAnchor.constraint(equalTo: trailingAnchor),
            sideRight.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
