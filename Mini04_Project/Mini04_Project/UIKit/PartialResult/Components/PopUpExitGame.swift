//
//  PopUpExitGame.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 03/04/24.
//

import UIKit

class PopUpExitGame: UIViewController {
    
    weak var delegate: ExitGameDelegate?

    private lazy var backgroundPopUp: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(resource: .backgroundPopUpExite)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var buttonConfirm: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(resource: .buttonPopUpExit), for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "FafoSans-Bold", size: 22)
        button.setTitle(String(localized: "Sair da partida"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tag = 0
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    
    private lazy var buttonCancel: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(resource: .buttonPopUpExit), for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "FafoSans-Bold", size: 22)
        button.setTitle(String(localized: "Cancelar"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    private lazy var buttonX: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(resource: .xPopUp), for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Tem certeza que\ndeseja sair da partida?")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "FafoSans-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black.withAlphaComponent(0.4)
        self.setupContrains()
    }
    
    
    @objc
    private func actionButton(_ value: UIButton!){
        let tag = value.tag
        self.delegate?.didTabButtun(tag)
    }
    
    private func setupContrains(){
        self.view.addSubview(backgroundPopUp)
        self.view.addSubview(buttonCancel)
        self.view.addSubview(buttonConfirm)
        self.view.addSubview(label)
        self.view.addSubview(buttonX)
        
        NSLayoutConstraint.activate([
            backgroundPopUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundPopUp.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label.topAnchor.constraint(equalTo: backgroundPopUp.topAnchor, constant: 80),
            label.centerXAnchor.constraint(equalTo: backgroundPopUp.centerXAnchor, constant: -10),
            
            buttonConfirm.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15),
            buttonConfirm.centerXAnchor.constraint(equalTo: backgroundPopUp.centerXAnchor),
            
            buttonCancel.topAnchor.constraint(equalTo: buttonConfirm.bottomAnchor, constant: 5),
            buttonCancel.centerXAnchor.constraint(equalTo: backgroundPopUp.centerXAnchor),
            
            buttonX.topAnchor.constraint(equalTo: backgroundPopUp.topAnchor, constant: 30),
            buttonX.trailingAnchor.constraint(equalTo: self.buttonConfirm.trailingAnchor, constant: 20)
        ])
    }
}
