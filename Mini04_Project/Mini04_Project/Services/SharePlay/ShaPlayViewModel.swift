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
class ShaPlayViewModel: ObservableObject{
    @Published var groupSession: GroupSession<WhereWhereActivity>?
    @Published var players: [Player] = []
    private var groupSessionMesager: GroupSessionMessenger?
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
    
    
    ///func que envia os dodos do Player local
    public func sendPlayerData(){
        
    }
    
    
    ///func que envia os pontos
    public func sendPoints(){
        //envia os dados para todo mundo
    }
    
    
    ///func que envia o powerUp para o inimingo
    public func sendPowerUps(){
        
    }
    
    
    ///func que confgura shareplay e recebe o dado do shareplay
    public func configurationSessin(_ session: GroupSession<WhereWhereActivity>){
        let messager = GroupSessionMessenger(session: session)
        self.groupSessionMesager = messager
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
    func setupMessageTasks(_ messenger: GroupSessionMessenger) {
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

