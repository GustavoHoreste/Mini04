//
//  PlayerData.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 18/03/24.
//

import Foundation
import GroupActivities
import UIKit

//Classe que armazena dados do palyer
//class PlayerData: Codable{
//    var playerId: UUID
//    var userName: String
//    var playerImage: Int
//    let userDefult = UserDefaults.standard
//    
////    init(playerId: UUID = UUID(), userName: String, playerImage: Int) {
////        self.playerId = playerId
////        self.userName = userName
////        self.playerImage = playerImage
////    }
//    
//    //MARK: - Codable
//    enum CodingKeys: CodingKey {
//        case playerId
//        case userName
//        case playerImage
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.playerId, forKey: .playerId)
//        try container.encode(self.userName, forKey: .userName)
//        try container.encode(self.playerImage, forKey: .playerImage)
//    }
//
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.playerId = try container.decode(UUID.self, forKey: .playerId)
//        self.userName = try container.decode(String.self, forKey: .userName)
//        self.playerImage = try container.decode(Int.self, forKey: .playerImage)
//    }
//    
//    public func creatPlayer() -> (name: String?, index){
//        let name = userDefult.string(forKey: UserDefaultKey.userName.rawValue)
//        let indexImage = 1
//        let id = UUID()
//        
//        print("Creie Novo player")
//        
//        return
//    }
//}
