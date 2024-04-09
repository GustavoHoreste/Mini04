//
//  SpecialObjectImage.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 20/03/24.
//

import UIKit

protocol SpecialObjectImageDelegate {
    func specialAppeared()
}

class SpecialObjectImage: UIImageView {
    
    var delegate: SpecialObjectImageDelegate?
    
    lazy var specialName = SpecialObjectLabel()
    
    lazy var timer: Timer = {
        let t = Timer()
        return t
    }()
    
    var symbol = AnyImageView(imagem: UIImage(named: "SpecialObjSymbol"))
    
    var tempo: Int = 10
    var timeToAppear: Int = 0
//    var specialIsOn = true
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
//        isHidden = false
        image = UIImage(named: "SpecialObjMold")
        
//        configTimerAppeerEspecialObject()
        
        addSubview(specialName)
        addSubview(symbol)
        
        NSLayoutConstraint.activate([
            specialName.centerXAnchor.constraint(equalTo: centerXAnchor),
            specialName.centerYAnchor.constraint(equalTo: centerYAnchor),
            symbol.centerXAnchor.constraint(equalTo: trailingAnchor),
            symbol.centerYAnchor.constraint(equalTo: topAnchor),
        ])
    }
    
    public func configTimerAppeerEspecialObject(_ timer: Double){
        tempo = Int(timer)
        timeToAppear = tempo/2
        
        playTimer()
        self.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    @objc func step() {
        tempo -= 1
        print(tempo)
        if tempo == timeToAppear {
            delegate?.specialAppeared()
        }
    }
    
    func specialFinded() {
        isHidden = true
        timer.invalidate()
    }
}
