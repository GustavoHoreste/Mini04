//
//  TimerSingleRound.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import UIKit

class TimerSingleRound: UILabel {

    var delegate: TimerRoundDelegate?
    
    var minutos: Int = 0
    var segundos: Int = 5
    
    lazy var timer: Timer = {
        let t = Timer()
        return t
    }()
    
    init() {
        super.init(frame: .zero)
        
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 24) else {fatalError()}
        
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        textColor = .black
        
        showText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    @objc func step() {
        if segundos > 0 {
            segundos -= 1
        } else {
            if minutos > 0 {
                minutos -= 1
                segundos = 59
            } else {
                timer.invalidate()
                segundos = 10
            }
        }
        if segundos >= 0 && segundos < 10 {
            text = "\(minutos):0\(segundos)"
        } else {
            text = "\(minutos):\(segundos)"
        }
        
        if minutos == 0 && segundos == 0 {
            pauseTimer()
            delegate?.timerRoundOver()
        }
    }
    
    func showText() {
        if segundos >= 0 && segundos < 10 {
            text = "\(minutos):0\(segundos)"
        } else {
            text = "\(minutos):\(segundos)"
        }
    }

}
