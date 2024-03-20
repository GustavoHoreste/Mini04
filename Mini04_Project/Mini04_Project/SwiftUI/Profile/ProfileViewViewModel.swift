//
//  ProfileViewViewModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 19/03/24.
//

import Foundation

enum UserDefaultKey: String{
    case userName = "UserName"
}

class ProfileViewViewModel: ObservableObject {
    @Published var canEdit: Bool = true
    @Published var textField: String = "ApplyUserName"
    let userDefault = UserDefaults.standard
    
    func addUserName() {
        userDefault.setValue(textField, forKey: UserDefaultKey.userName.rawValue)
    }
    
    init() {
        textField = userDefault.string(forKey: UserDefaultKey.userName.rawValue) ?? "Could not find"
    }
    
}
