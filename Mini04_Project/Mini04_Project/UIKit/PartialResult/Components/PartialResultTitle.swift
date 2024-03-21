//
//  PartialResultTitle.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 21/03/24.
//

import UIKit

class PartialResultTitle: UILabel {
    
    init(){
        super.init(frame: .zero)
        self.text = "Round Results"
        self.font = UIFont.boldSystemFont(ofSize: 40)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

}
