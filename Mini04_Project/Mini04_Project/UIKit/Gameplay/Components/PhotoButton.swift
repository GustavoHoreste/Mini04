//
//  PhotoButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import UIKit

protocol PhotoButtonDelegate: AnyObject {
    func photoButtonAction()
}

class PhotoButton: UIButton {

    weak var delegate: PhotoButtonDelegate?
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setImage(UIImage(named: "PhotoButton"), for: .normal)
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    
    @objc func buttonAction() {
        delegate?.photoButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
