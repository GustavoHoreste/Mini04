//
//  AlertPowerView.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 01/04/24.
//

import UIKit

class AlertPowerView: UIImageView {
    
    lazy var labelAlert: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VOCÊ FOI\nATINGIDO\nPOR UM"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var iconPower: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return icon
    }()

    lazy var namePower: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconPower, namePower])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 5
        return stack
    }()
    
    init(icon: UIImage, name: String) {
        super.init(frame: .zero)
        
        iconPower.image = icon
        namePower.text = name
        
        translatesAutoresizingMaskIntoConstraints = false
        
        image = UIImage(systemName: "square")
        
        addSubview(labelAlert)
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 180),
            heightAnchor.constraint(equalToConstant: 230),
            labelAlert.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            labelAlert.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            labelAlert.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
