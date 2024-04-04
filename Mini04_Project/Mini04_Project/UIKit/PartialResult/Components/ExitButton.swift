//
//  ExitButton.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 03/04/24.
//

import UIKit

protocol ExitGameDelegate: AnyObject{
    func exitGame()
    func didTabButtun(_ tab: Int)
}

class ExitButton: UIButton {

    weak var delegate: ExitGameDelegate?
    
    init(){
        super.init(frame: .zero)
        self.setBackgroundImage(UIImage(resource: .exitButton), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(ready), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func ready(){
        self.delegate?.exitGame()
    }
}
