//
//  ResultMenuButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import UIKit

class ResultMenuButton: UIButton {

    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(goToMenu), for: .touchUpInside)
        setBackgroundImage(UIImage(systemName: "squareshape.fill"), for: .normal)
        setTitle("Back to menu", for: .normal)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 200),
            heightAnchor.constraint(equalToConstant: 100),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    @objc func goToMenu() {
        print("voltar pro menu")
    }

}