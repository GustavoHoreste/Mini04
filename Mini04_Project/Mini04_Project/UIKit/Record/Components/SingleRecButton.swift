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
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 24) else {fatalError()}
        self.translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(recAction), for: .touchUpInside)
        setBackgroundImage(UIImage(resource: .buttonBack), for: .normal)
        self.setTitle(String(localized: "Recomeçar"), for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    @objc func recAction() {
        delegate?.recomecarAction()
    }
}
