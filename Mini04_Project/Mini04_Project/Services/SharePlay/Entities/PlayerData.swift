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
class PlayerData: Codable{
    var playerId: UUID
    var userName: String
    var playerImage: Int
    
    init(playerId: UUID, userName: String, playerImage: Int) {
        self.playerId = playerId
        self.userName = userName
        self.playerImage = playerImage
    }
}
