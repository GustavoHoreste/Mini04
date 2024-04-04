//
//  TimerObject.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 19/03/24.
//

import UIKit

protocol TimerObjectDelegate {
    func timerObjectOver()
}

class TimerObject: UILabel {
    
    var delegate: TimerObjectDelegate?
    
    var minutos: Int = 0
    var segundos: Int = 20
    
    lazy var timer: Timer = {
        let t = Timer()
        return t
    }()
    
    let startColor = UIColor(hue: 0.0, saturation: 0.0, brightness: 0.0, alpha: 1.0)
    
    var currentSaturation: CGFloat = 120.0/360.0{
        didSet {
            textColor = UIColor(hue: 0.0, saturation: currentSaturation, brightness: currentBrightness, alpha: 1.0)
        }
    }
    
    var currentBrightness: CGFloat = 0
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 20)
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
    func resetTimerObject() {
        segundos = 20
        showText()
        currentBrightness = 0.0
        currentSaturation = 0.0
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
            resetTimerObject()
            delegate?.timerObjectOver()
        }
        
        if minutos == 0 && (segundos <= 15 && segundos >= 5) {
            changeColor()
        }
    }
    
    func showText() {
        if segundos >= 0 && segundos < 10 {
            text = "\(minutos):0\(segundos)"
        } else {
            text = "\(minutos):\(segundos)"
        }
    }
    
    func changeColor() {
        // Calcula a próxima etapa da transição de cor
        currentBrightness += 1.0 / 10.0
        currentSaturation += 1.0 / 10.0 // 15 etapas no total
    }
}
