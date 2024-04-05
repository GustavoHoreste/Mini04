//
//  NormalListCell.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 05/04/24.
//

import UIKit

class NormalListCell: UICollectionViewCell {
    
    static var identifier = "NormalListCell"
    
    let background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .rankingPlayerBC)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let rankingBg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .bkroxo)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let position: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "FafoSans-Bold", size: 48)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let playerName: UILabel = {
        let label = UILabel()
        label.text = "Name default"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "FafoSans-Regular", size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let playerScore: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "FafoSans-Bold", size: 40)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
            background.topAnchor.constraint(equalTo: self.topAnchor, constant: 75),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
        ])
    }
    
    public func changePositionBG(_ position: Int){
        switch position{
        case 0:
            rankingBg.image = UIImage(resource: .bkouro)
            self.position.text = "\(position+1)"
        case 1:
            rankingBg.image = UIImage(resource: .bkprata)
            self.position.text = "\(position+1)"
        case 2:
            rankingBg.image = UIImage(resource: .bkbronze)
            self.position.text = "\(position+1)"
        default:
            rankingBg.image = UIImage(resource: .bkroxo)
            self.position.text = "\(position+1)"
        }
    }
    
    
    private func setupLabels() {
        background.addSubview(rankingBg)
        background.addSubview(playerName)
        background.addSubview(playerScore)
        background.addSubview(position)
        
        NSLayoutConstraint.activate([
            rankingBg.bottomAnchor.constraint(equalTo: background.centerYAnchor, constant: 10),
            rankingBg.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            rankingBg.widthAnchor.constraint(equalToConstant: self.frame.width * 0.3),
            rankingBg.widthAnchor.constraint(equalToConstant: self.frame.height * 0.3),
            
            position.centerXAnchor.constraint(equalTo: rankingBg.centerXAnchor, constant: -5),
            position.centerYAnchor.constraint(equalTo: rankingBg.centerYAnchor),
            
            playerName.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 80),
            playerName.topAnchor.constraint(equalTo: background.topAnchor, constant: 5),
            
            playerScore.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -20),
            playerScore.topAnchor.constraint(equalTo: background.topAnchor, constant: -5)
        ])
    }
    
}
