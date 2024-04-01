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
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(ready), for: .touchUpInside)
        setBackgroundImage(UIImage(systemName: "squareshape.fill"), for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    public func witchLabel(_ value: Bool){
        if !value{
            self.setTitle("Preparado?", for: .normal)
            return
        }
        self.setTitle("Start", for: .normal)
    }
    
    @objc
    func ready() {
        delegate?.ready()
    }
}
