//
//  ChangeCountLabel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 31/03/24.
//

import UIKit

protocol ChangeCountLabelDelegate: AnyObject {
    func countEnded()
}

class ChangeCountLabel: UIImageView {

    weak var delegate: ChangeCountLabelDelegate?
    
    var number = 3 {
        didSet {
            DispatchQueue.main.async {
                self.label.text = "\(self.number)"
            }
        }
    }
    
    lazy var countMold: UIImageView = {
        let mold = UIImageView(image: UIImage(resource: .changeCountMold))
        mold.translatesAutoresizingMaskIntoConstraints = false
        return mold
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "FafoSans-Bold", size: 18)
        label.textColor = .black
        label.text = "3"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(resource: .changeCountMold)
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subtractCount() {
        if number >= 1 {
            number -= 1
        }
        verifyCount()
    }
    
    func verifyCount() {
        if number == 0 {
            alpha = 0.3
            delegate?.countEnded()
        }
    }
}
