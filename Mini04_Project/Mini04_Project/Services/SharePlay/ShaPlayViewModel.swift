//
//  SharePlayPresenter.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 18/03/24.
//

import SwiftUI
import Combine
import GroupActivities

@MainActor
final class ShaPlayViewModel: ObservableObject{
    @Published var players: [Player] = []
    private var groupSession: GroupSession<WhereWhereActivity>?
    private var mesager: GroupSessionMessenger?
    private var subscriptions = Set<AnyCancellable>()
    private var tasks = Set<Task<Void, Never>>()
    
    
    ///funcao que Start SharePlay
    public func startSession(){
        Task{
            do{
                _ = try await WhereWhereActivity().activate()
            }catch{
                print("Error in init session [SharePlayWorker.startSession] - ", error.localizedDescription)
            }
        }
    }
    
    
    /// Função que envia os dados do jogador local.
    public func sendPlayerData(_ player: Player) {
        // Implementação para enviar os dados do jogador local.
    }

    /// Função que envia os pontos.
    public func sendPoints(_ points: UserPoints) {
        // Implementação para enviar os pontos para todos os participantes.
    }

    /// Função que envia o PowerUp para o inimigo.
    public func sendHindrances(_ hindrances: SendHindrances) {
        // Implementação para enviar os dados do PowerUp para o inimigo.
    }

    /// Função que envia o status.
    public func sendStatus(_ status: StatusUsers) {
        // Implementação para enviar o status para os outros participantes.
    }

    /// Função que envia os dados de configuração da partida.
    public func sendConfigMatch(_ config: MatchConfig) {
        // Implementação para enviar os dados de configuração da partida para os outros participantes.
    }

    
    private func sendData<T: Codable>(_ model: T) {
        Task {
            do {
                try await mesager?.send(model)
            } catch {
                print("Error in send model session [SharePlayViewModel.sendData] - ", error.localizedDescription)
            }
        }
    }
    
    
    ///func que confgura shareplay e recebe o dado do shareplay
    public func configurationSessin(_ session: GroupSession<WhereWhereActivity>){
        let messager = GroupSessionMessenger(session: session)
        self.mesager = messager
        self.groupSession = session
        
        groupSession?.$activeParticipants
            .sink{ newParticipant in
                print(newParticipant.count, " - ",newParticipant)
            }
            .store(in: &subscriptions)
        
        setupMessageTasks(messager)
        
        groupSession?.join()
    }
    
    
    ///funcao que recebe os dados shareplay
    private func setupMessageTasks(_ messenger: GroupSessionMessenger) {
        /// Recebe os players
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: Player.self) {
                    handle(message)
                }
            }
        )
        /// Recebe os pontos
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: UserPoints.self) {
                    handle(message)
                }
            }
        )
        /// Recebe os obstáculos (PowerUps dos inimigos)
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: SendHindrances.self) {
                    handle(message)
                }
            }
        )
        /// Recebe o status
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: StatusUsers.self) {
                    handle(message)
                }
            }
        )
        /// Recebe as configurações da partida
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: MatchConfig.self) {
                    handle(message)
                }
            }
        )
    }
    
    private func handle(_ model: Player) {
        print("Player: \(model)")
    }

    private func handle(_ model: SendHindrances) {
        print("SendHindrances: \(model)")
    }

    private func handle(_ model: StatusUsers) {
        print("StatusUsers: \(model)")
    }

    private func handle(_ model: UserPoints) {
        print("UserPoints: \(model)")
    }

    private func handle(_ model: MatchConfig) {
        print("MatchConfig: \(model)")
    }
}

