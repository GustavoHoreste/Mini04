//
//  SingleResultLabel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import UIKit

class SingleResultLabel: UILabel {

    var qntd = -2 {
        didSet {
            text = "\(qntd)"
        }
    }
    
    lazy var pointsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .white
        label.text = "Score:"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 30, weight: .regular)
        textColor = .white
        
        addSubview(pointsLabel)
        
        NSLayoutConstraint.activate([
            pointsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pointsLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: -10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
