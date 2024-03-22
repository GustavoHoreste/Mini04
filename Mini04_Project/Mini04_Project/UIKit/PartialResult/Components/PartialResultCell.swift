//
//  PartialResultCell.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 20/03/24.
//

import UIKit

class PartialResultCell: UICollectionViewCell {
    static var identifier = "PartialResultCell"
    let background: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let position: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let playerName = UILabel()
    let playerScore = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupBackground()
        setupLabels()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackground()
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    private func setupBackground() {
        addSubview(background)
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            background.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    private func setupLabels() {
        background.addSubview(position)
        
        background.addSubview(playerName)
        playerName.translatesAutoresizingMaskIntoConstraints = false
        
        background.addSubview(playerScore)
        playerScore.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            position.leadingAnchor.constraint(equalTo: background.leadingAnchor,constant: 10),
            position.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            position.topAnchor.constraint(equalTo: background.topAnchor),

            playerName.leadingAnchor.constraint(equalTo: position.trailingAnchor, constant: 20),
            playerName.topAnchor.constraint(equalTo: background.topAnchor),
            playerName.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            
            playerScore.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -20),
            playerScore.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            playerScore.topAnchor.constraint(equalTo: background.topAnchor)
        ])
    }
}
