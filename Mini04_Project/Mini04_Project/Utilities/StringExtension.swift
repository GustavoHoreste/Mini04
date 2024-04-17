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
    
    func translate() -> String {
        guard let preferredLanguage = Locale.preferredLanguages.first else {return ""}
        print(preferredLanguage)
//        let locale = Locale(identifier: preferredLanguage)
//        guard let languageCode = locale.language.languageCode?.identifier else {return ""}
//        print(languageCode)
        // Obtém o bundle para o idioma desejado
        guard let path = Bundle.main.path(forResource: preferredLanguage, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            print("SAIU DO PATH TRANSLATE")
            return self // Se o arquivo de idioma não for encontrado, retorna a string original
        }
        
        // Traduz a string para o idioma especificado
        let translatedString = bundle.localizedString(forKey: self, value: nil, table: nil)
        return translatedString
    }
    
}
