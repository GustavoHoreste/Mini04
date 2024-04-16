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
    
    weak var delegate: EndgameButtonDelegate?
    
//    var background: UIView = {
//        var background = UIView()
//        background.layer.cornerRadius = 30
//        background.backgroundColor = .gray
//        background.translatesAutoresizingMaskIntoConstraints = false
//        return background
//    }()
//    
//    var label: UILabel = {
//        var label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 20)
//        label.text = "Terminar Jogo"
//        label.textColor = .white
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.setBackgroundImage(UIImage(resource: .endGameButton), for: .normal)
        self.setTitle(String(localized: "Terminar partida"), for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont(name: "FafoSans-Bold", size: 22)
        isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
//        self.addSubview(background)
//        background.addSubview(label)
//        
//        NSLayoutConstraint.activate([
////            background.topAnchor.constraint(equalTo: self.topAnchor),
////            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
////            background.trailingAnchor.constraint(equalTo: self.leadingAnchor),
////            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            background.widthAnchor.constraint(equalToConstant: 200),
//            background.heightAnchor.constraint(equalToConstant: 110),
//            
//            label.topAnchor.constraint(equalTo: background.topAnchor),
//            label.leadingAnchor.constraint(equalTo: background.leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: background.trailingAnchor),
//            label.bottomAnchor.constraint(equalTo: background.bottomAnchor),
//        ])
    }
    
    public func diableButton(){
        isHidden.toggle()
    }
    
    @objc
    func buttonAction(){
        delegate?.endGame()
    }
}
