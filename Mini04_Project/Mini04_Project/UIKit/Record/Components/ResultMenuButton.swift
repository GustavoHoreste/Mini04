//
//  ResultMenuButton.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 25/03/24.
//

import UIKit

protocol ResultMenuButtonDelegate: AnyObject {
    func menuAction()
}

class ResultMenuButton: UIButton {

    weak var delegate: ResultMenuButtonDelegate?
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(goToMenu), for: .touchUpInside)
        setBackgroundImage(UIImage(named: "SingleLeaveButton"), for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    @objc func goToMenu() {
        delegate?.menuAction()
    }

}
