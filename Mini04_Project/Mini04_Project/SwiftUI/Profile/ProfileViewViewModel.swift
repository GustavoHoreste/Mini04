//
//  ProfileViewViewModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 19/03/24.
//

import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var canEdit:Bool = true
    @Published var textField:String = "ApplyUserName"
    let userDefault = UserDefaults.standard
    
    func addUserName() {
        userDefault.setValue(textField, forKey: "UserName")
    }
    
    init() {
        textField = userDefault.string(forKey: "UserName") ?? "Could not find"
    }
    
}
