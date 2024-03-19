//
//  ChangeButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import UIKit

protocol ChangeButtonDelegate: AnyObject {
    func changeButtonAction()
}

class ChangeButton: UIButton {

    weak var delegate: ChangeButtonDelegate?
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(systemName: "arrow.circlepath")
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40)
        let resizedImage = image?.withConfiguration(symbolConfig)

        setImage(resizedImage, for: .normal)
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
    }
    
    @objc func buttonAction() {
        delegate?.changeButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
