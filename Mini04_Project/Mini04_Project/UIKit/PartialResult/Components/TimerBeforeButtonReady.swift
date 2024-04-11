//
//  TimerBeforeButtonReady.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 03/04/24.
//

import UIKit

class TimerBeforeButtonReady: UIView {
    
    private var timer: Timer?
    private var count: Int = 5
    
    private lazy var labelTime: UILabel = {
        let label = UILabel()
        label.text = "Próxima rodada em:"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "FafoSans-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var amoutTime: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "FafoSans-Bold", size: 80)
        label.textColor = UIColor(resource: .redTime)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isHidden = true
        self.setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains(){
        self.addSubview(labelTime)
        self.addSubview(amoutTime)
        
        NSLayoutConstraint.activate([
            labelTime.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelTime.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            amoutTime.topAnchor.constraint(equalTo: self.labelTime.bottomAnchor, constant: 15),
            amoutTime.centerXAnchor.constraint(equalTo: labelTime.centerXAnchor),
        ])
    }
    
    
    public func startCount(){
        isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
    }
    
    @objc 
    private func countTime(){
        count -= 1
        if count >= 0{
            amoutTime.text = "\(count)"
            return
        }
        invalidetTimer()
    }
    
    private func invalidetTimer(){
        timer?.invalidate()
        count = 5
        amoutTime.text = "\(count)"
        isHidden = true
    }
}
