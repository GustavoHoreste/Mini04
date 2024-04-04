//
//  UILableRepresentable.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 26/03/24.
//

import SwiftUI


struct UILableRepresentable: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UILabel {
        let textView = UILabel()
        textView.font = UIFont(name:"FafoSans-Bold",size:15)
        textView.numberOfLines = 2
        textView.lineBreakMode = .byClipping
        textView.textAlignment = .justified
        return textView
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}
