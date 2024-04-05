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
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 16) else {fatalError()}
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VOCÊ FOI\n     ATINGIDO\n          POR UM"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        label.rotate(degrees: -12)
        return label
    }()
    
    lazy var iconPower: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return icon
    }()

    lazy var namePower: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 16) else {fatalError()}
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        return label
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconPower, namePower])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 15
        stack.rotate(degrees: -12)
        return stack
    }()
    
    var isAlertAnimating = false
    var centerX = CGFloat()
    
    init(icon: UIImage, name: String) {
        super.init(frame: .zero)
        
        iconPower.image = icon
        namePower.text = name
        
        translatesAutoresizingMaskIntoConstraints = false
        
        image = UIImage(named: "AlertPower")
        
        addSubview(labelAlert)
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            labelAlert.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -15),
            labelAlert.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            labelAlert.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            vStack.topAnchor.constraint(equalTo: labelAlert.bottomAnchor, constant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
