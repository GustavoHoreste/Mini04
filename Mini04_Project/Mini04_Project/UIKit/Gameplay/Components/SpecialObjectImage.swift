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
    
    var tempo: Int = 30
    var timeToAppear: Int = 0
    var specialIsOn = false
    
    init() {
        super.init(frame: .zero)
        
        timeToAppear = tempo/2
        
        translatesAutoresizingMaskIntoConstraints = false
        
        isHidden = true
        image = UIImage(systemName: "square")
        
        addSubview(specialName)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 220),
            heightAnchor.constraint(equalToConstant: 50),
            specialName.centerXAnchor.constraint(equalTo: centerXAnchor),
            specialName.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        playTimer()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    @objc func step() {
        tempo -= 1
        print("tempo \(tempo) // appear: \(timeToAppear)")
        if tempo == timeToAppear {
            specialIsOn = true
            isHidden = false
            delegate?.specialAppeared()
        }
    }
    
    func specialFinded() {
        removeFromSuperview()
        timer.invalidate()
    }
    
}
