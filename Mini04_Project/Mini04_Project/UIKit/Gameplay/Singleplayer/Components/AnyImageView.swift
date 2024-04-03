//
//  AnyImageView.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 02/04/24.
//

import UIKit

class AnyImageView: UIImageView {

    init(imagem: UIImage?) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        image = imagem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
