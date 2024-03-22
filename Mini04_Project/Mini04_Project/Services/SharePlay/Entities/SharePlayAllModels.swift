//
//  Player.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 19/03/24.
//

import SwiftUI
import GroupActivities
import Foundation


/// Estrutura que representa um jogador
struct Player: Codable, Hashable {
    let id: UUID
    var userName: String
    let playerImage: Int
    var isHost: Bool
    let participantType: ParticipantType
    var points: Int
    var statusUser: Bool
}

struct Players: Codable{
    let players: [Player]
}

/// Estrutura que representa a configuração de uma partida
struct MatchConfig: Codable {
    let roundTime: Double
    let amoutRound: Int
    let powerUps: Bool
    let metchMode: MatchMode
}


/// Estrutura que representa os pontos enviados por um usuário
struct UserPoints: Codable {
    let playerID: UUID
    let points: Int
}


/// Estrutura que representa os impedimentos (hindrances) enviados entre jogadores
struct SendHindrances: Codable {
    let localPlayerID: UUID
    let adversaryID: UUID
    let hindrance: PowerUps
}

///Estrutura que representa o status do usuario(ponto ou nao)
struct StatusUsers: Codable{
    let localPlayerID: UUID
    let status: Bool
}

/// Enumeração que representa o tipo de participante (jogador ou espectador)
enum ParticipantType: Codable {
    case player
    case espectetor
}


/// Enumeração que representa o modo de partida
enum MatchMode: Codable {
    case objestosChoise
    case colorChoise
    case allChoise
}


/// Enumeração que representa os diferentes tipos de "power-ups"
enum PowerUps: Codable {
    case freeze
    case subtrac
    case switchWord
    case shuffleWord
    case changeCamera
}
