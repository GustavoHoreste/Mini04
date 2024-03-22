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
    
    lazy var count: PontosLabel = {
        let pts = PontosLabel()
        pts.number = 3
        return pts
    }()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(systemName: "arrow.circlepath")
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40)
        let resizedImage = image?.withConfiguration(symbolConfig)

        setImage(resizedImage, for: .normal)
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        addSubview(count)
        
        NSLayoutConstraint.activate([
            count.trailingAnchor.constraint(equalTo: trailingAnchor),
            count.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
    @objc func buttonAction() {
        delegate?.changeButtonAction()
    }
    
    func subtractCount() {
        if count.number >= 1 {
            count.number -= 1
        }
        verifyCount()
    }
    
    func verifyCount() {
        if count.number == 0 {
            alpha = 0.3
            isUserInteractionEnabled = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
