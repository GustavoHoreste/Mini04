//
//  ProfileViewViewModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 19/03/24.
//

import Foundation

enum UserDefaultKey: String{
    case userName = "UserName"
    case indexImage = "IndexImage"
}

class ProfileViewViewModel: ObservableObject {
    @Published var canEdit: Bool = true
    @Published var textField: String = "ApplyUserName"
    let userDefault = UserDefaults.standard
    let nomesPadrao = ["Spectra", "Aether", "Nimbus", "Phoenix", "Astra"]

    
    init() {
        textField = userDefault.string(forKey: UserDefaultKey.userName.rawValue) ?? nomesPadrao.randomElement()!
        addUserName()
    }
    
    public func addUserName() {
        userDefault.setValue(textField, forKey: UserDefaultKey.userName.rawValue)
    }
}
