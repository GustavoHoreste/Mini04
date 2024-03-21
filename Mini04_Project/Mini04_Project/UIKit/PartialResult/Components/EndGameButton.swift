//
//  EndGameButton.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 21/03/24.
//

import UIKit

protocol EndgameButtonDelegate: AnyObject {
    func endGame()
}

class EndGameButton: UIButton {
    
    weak var delegate:EndgameButtonDelegate?
    
    var background: UIView = {
        var background = UIView()
        background.layer.cornerRadius = 30
        background.backgroundColor = .gray
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    var label: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(background)
        background.addSubview(label)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.leadingAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label.topAnchor.constraint(equalTo: background.topAnchor),
            label.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: background.bottomAnchor)
        ])
        
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc
    func buttonAction(){
        delegate?.endGame()
    }
}
