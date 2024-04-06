//
//  StringExtension.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 20/03/24.
//

import Foundation

extension String {
    func shuffled() -> String {
        var characters = Array(self)
        characters.shuffle()
        return String(characters)
    }
    
    func verifyObj() -> String {
        switch self {
        case "Livro:Caderno":
            return "Livro"
        case "Shorts:Calca":
            return "Shorts"
        default:
            return self
        }
    }
}
