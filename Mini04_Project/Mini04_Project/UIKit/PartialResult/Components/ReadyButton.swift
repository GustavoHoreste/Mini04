//
//  ReadyButton.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 21/03/24.
//

import UIKit

protocol ReadyButtonDelegate: AnyObject {
    func ready()
}

class ReadyButton: UIButton {
    
    weak var delegate: ReadyButtonDelegate?
    var timer: Timer = Timer()
    var count = 6
    
    public lazy var labelTime: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "FafoSans-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(ready), for: .touchUpInside)
        isHidden = false
        setupConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    private func setupConstrains(){
        self.addSubview(labelTime)
        
        NSLayoutConstraint.activate([
            labelTime.bottomAnchor.constraint(equalTo: self.topAnchor),
            labelTime.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    public func witchLabel(_ value: Bool){
        if !value{
            self.setBackgroundImage(UIImage(resource: .isReadyButton), for: .normal)
            labelTime.text = String(localized: "Está preparado?")
            return
        }
        self.setBackgroundImage(UIImage(resource: .startGame), for: .normal)

    }
    
    public func toggleIsHiden(){
        isHidden = true
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(readyButton), userInfo: nil, repeats: true)
    }
    
    @objc
    private func readyButton(){
        count -= 1
        if count == 0{
            count = 6
            isHidden = false
            timer.invalidate()
        }
    }
    
    @objc
    func ready() {
        delegate?.ready()
    }
}
