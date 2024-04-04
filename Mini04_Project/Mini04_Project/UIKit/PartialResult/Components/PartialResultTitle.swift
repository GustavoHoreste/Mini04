//
//  PartialResultTitle.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 21/03/24.
//

import UIKit

class PartialResultTitle: UIImageView {
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(resource: .topsRounds)
        self.contentMode = .scaleAspectFill
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

}
