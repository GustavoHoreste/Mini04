//
//  ProfileViewViewModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 19/03/24.
//

import Foundation

enum UserDefaultKey: String{
    case userName = "UserName"
    case indexImage = "conito"
    case userID = "userID"
}

class ProfileViewViewModel: ObservableObject {
    @Published var textField: String = "ApplyUserName"
    @Published var newImage: String = UserDefaults.standard.string(forKey: UserDefaultKey.indexImage.rawValue) ?? "ImagePicker"
    let userDefault = UserDefaults.standard
    let nomesPadrao = ["Spectra", "Aether", "Nimbus", "Phoenix", "Astra"]
    let imageNames: [String] = ["conito", "bolito", "xicarita", "camerita"]

    
    init() {
        textField = userDefault.string(forKey: UserDefaultKey.userName.rawValue) ?? nomesPadrao.randomElement()!
        addUserName()
        verifyExistemUser()
//        imageTapped()
    }
    
    public func addUserName() {
        userDefault.setValue(textField, forKey: UserDefaultKey.userName.rawValue)
    }
    
    private func verifyExistemUser(){
        if let id = userDefault.string(forKey: UserDefaultKey.userID.rawValue){
            print("user ja existe: \(id)")
            return
        }
        creatID()
    }
    
    private func creatID(){
        let id = UUID()
        print("id dp user defult e: \(id)")
        userDefault.setValue(id.uuidString, forKey:  UserDefaultKey.userID.rawValue)
    }
    
    public func imageTapped() {
        userDefault.setValue(newImage, forKey: UserDefaultKey.indexImage.rawValue)
    }
//    
//    public func returnValueImage() -> String{
//        return userDefault.string(forKey: UserDefaultKey.indexImage.rawValue) ?? "ImagePicker"
//    }
}
