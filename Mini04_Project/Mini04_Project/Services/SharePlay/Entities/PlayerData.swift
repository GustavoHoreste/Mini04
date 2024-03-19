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
class PlayerData{
    var playerId:Set<Participant>
    var userName: String
    var playerImage: Int
    
    init(playerId: Set<Participant>, userName: String, playerImage: Int) {
        self.playerId = playerId
        self.userName = userName
        self.playerImage = playerImage
    }
}
