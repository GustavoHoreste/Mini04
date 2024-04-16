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
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
    
    func findKey(inTable table: String = "Localizable") -> String? {
        guard let path = Bundle.main.path(forResource: table, ofType: "strings"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: String] else {
            return nil
        }
        
        // Buscando a chave para a string atual
        return dict.first { $0.value == self }?.key
    }
    
}
