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
    
    var minutos: Int = 10
    var segundos: Int = 0
    
    lazy var timer: Timer = {
        let t = Timer()
        return t
    }()
    
    init(minutos: Int, segundos: Int) {
        super.init(frame: .zero)
        
        self.minutos = minutos
        self.segundos = segundos
        
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 20)
        textColor = .label
        
        showText()
        playTimer()
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
        segundos = 15
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
            resetTimerObject()
            delegate?.timerObjectOver()
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
