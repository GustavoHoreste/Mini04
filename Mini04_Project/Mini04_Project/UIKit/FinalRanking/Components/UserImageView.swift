//
//  UserImageView.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import UIKit

class UserImageView: UIImageView {
    var nameUser: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 15) else {fatalError()}
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    var pointsUser: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "FafoSans-Bold", size: 36) else {fatalError()}
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    init(distancia: CGFloat) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "FinalCircle")
        
        addSubview(nameUser)
        addSubview(pointsUser)
        
        NSLayoutConstraint.activate([
            nameUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameUser.bottomAnchor.constraint(equalTo: topAnchor, constant: -10),
            pointsUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            pointsUser.topAnchor.constraint(equalTo: bottomAnchor, constant: distancia),
            self.widthAnchor.constraint(equalToConstant: 93),
            self.heightAnchor.constraint(equalToConstant: 93),
        ])
        
        self.isHidden = false
    }
    
    public func isHiden(){
        self.isHidden.toggle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
