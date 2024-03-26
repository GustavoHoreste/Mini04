//
//  HighscoreLabel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import UIKit

class HighscoreLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 30, weight: .semibold)
        textColor = .white
        textAlignment = .center
        numberOfLines = 0
        
    }
    
    func verifyHighScore(points: Int) {
        print("Pontos pro Highscore: \(points)")
        if points > UserDefaults.standard.integer(forKey: "highscore") {
            UserDefaults.standard.setValue(points, forKey: "highscore")
        }
        text = "Highscore: \n\(UserDefaults.standard.integer(forKey: "highscore"))"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
