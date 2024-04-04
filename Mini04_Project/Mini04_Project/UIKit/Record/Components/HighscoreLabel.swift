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
        
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 64) else {fatalError()}
        
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        textColor = .black
        textAlignment = .center
        numberOfLines = 0
        
    }
    
    func verifyHighScore(points: Int) {
        print("Pontos pro Highscore: \(points)")
        if points > UserDefaults.standard.integer(forKey: "highscore") {
            UserDefaults.standard.setValue(points, forKey: "highscore")
        }
        text = "\(UserDefaults.standard.integer(forKey: "highscore"))"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
