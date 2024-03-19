//
//  ProfileImage.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import UIKit

class ProfileImage: UIImageView {

    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let imagem = UIImage(systemName: "person.crop.circle")
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40)
        let resizedImage = image?.withConfiguration(symbolConfig)
        
        image = imagem
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
