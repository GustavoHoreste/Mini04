//
//  TimerRound.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 19/03/24.
//

import UIKit

protocol TimerRoundDelegate {
    func timerRoundOver()
}

class TimerRound: UILabel {
    
    var delegate: TimerRoundDelegate?
    
    var minutos: Int = 0
    var segundos: Int = 0
    
    lazy var timer: Timer = {
        let t = Timer()
        return t
    }()
    
    let startColor = UIColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: 1.0)
    
    var currentSaturation: CGFloat = 0 {
        didSet {
            textColor = UIColor(hue: 0.0, saturation: currentSaturation, brightness: 0.0, alpha: 1.0)
        }
    }
    
    var currentBrightness: CGFloat = 0
    
    init() {
        super.init(frame: .zero)
        
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 20) else {fatalError()}
        
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        textColor = startColor
        
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
    
    public func config(_ amouthTimer: Double){
        
        if amouthTimer > 60{
            let minutos = Int(amouthTimer/60)
            let segundos = Int(amouthTimer) - minutos * 60
            
            self.minutos = minutos
            self.segundos = segundos
        }else{
            self.segundos = Int(amouthTimer)
        }
        
        showText()
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
            delegate?.timerRoundOver()
        }
        
        if minutos == 0 && (segundos <= 30 && segundos >= 10) {
            changeColor()
        }
    }
    
    func showText() {
        if segundos == 60 {
            text = "\(minutos+1):00"
        }
        else if segundos >= 0 && segundos < 10 {
            text = "\(minutos):0\(segundos)"
        } else {
            text = "\(minutos):\(segundos)"
        }
    }
    
    func changeColor() {
        // Calcula a próxima etapa da transição de cor
        currentBrightness += 1.0 / 20.0
        currentSaturation += 1.0 / 20.0 // 20 etapas no total
    }
    
}
