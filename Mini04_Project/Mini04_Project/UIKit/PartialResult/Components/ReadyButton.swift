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
        setTitle("Not Ready", for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    @objc
    func ready() {
        delegate?.ready()
    }
}
