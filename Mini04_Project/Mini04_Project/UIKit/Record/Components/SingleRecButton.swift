//
//  SingleRecButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import UIKit

protocol SingleRecButtonDelegate: AnyObject {
    func recomecarAction()
}

class SingleRecButton: UIButton {

    weak var delegate: SingleRecButtonDelegate?
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(recAction), for: .touchUpInside)
        setBackgroundImage(UIImage(named: "SingleRecButton"), for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    @objc func recAction() {
        delegate?.recomecarAction()
    }

}
