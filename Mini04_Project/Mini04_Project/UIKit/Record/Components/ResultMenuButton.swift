//
//  ResultMenuButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import UIKit

protocol ResultMenuButtonDelegate: AnyObject {
    func menuAction()
}

class ResultMenuButton: UIButton {

    weak var delegate: ResultMenuButtonDelegate?
    
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
        delegate?.menuAction()
    }

}
