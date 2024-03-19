//
//  TimerRound.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 19/03/24.
//

import UIKit

protocol TimerRoundDelegate {
    func acaoTempoMemorizarAcabou()
    func acaoTempoAcabou()
    func acaoTempoResponderAcabou()
}

class TimerRound: UILabel {
    
    var delegate: TimerRoundDelegate?
    
    lazy var minutos = 1
    lazy var segundos = 30
    
    lazy var tempoMemorizarAcabou  = false
    lazy var tempoPausado = false
    
    lazy var minPausado = 0
    lazy var segPausado = 0
    
    lazy var timer: Timer = {
        let t = Timer()
        return t
    }()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    func pauseTimer() {
        timer.invalidate()
        minPausado = minutos
        segPausado = segundos
    }
    func resetTimer() {
        timer.invalidate()
        segundos = 10
        text = "\(segundos)"
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
        
        if minutos == 0 && segundos == 0 && !tempoMemorizarAcabou && !tempoPausado{
            delegate?.acaoTempoMemorizarAcabou()
        }
        if minutos == 0 && segundos == 0 && tempoMemorizarAcabou && !tempoPausado{
            delegate?.acaoTempoAcabou()
        }
        if minutos == 0 && segundos == 0 && tempoMemorizarAcabou && tempoPausado{
            tempoPausado = false
            delegate?.acaoTempoResponderAcabou()
        }
    }
    
    func mudarTempo() {
        minutos = 1
        segundos = 30
        tempoMemorizarAcabou = true
    }
    
    func tempoResponder() {
        minutos = 0
        segundos = 10
        playTimer()
        tempoPausado = true
    }
    
    func voltarTempo() {
        minutos = minPausado
        segundos = segPausado
    }
    
}
