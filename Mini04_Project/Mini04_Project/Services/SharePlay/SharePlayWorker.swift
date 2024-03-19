//
//  SharePlayWorker.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 18/03/24.
//

import SwiftUI
import Combine
import GroupActivities

final class SharePlayWorker{
    ///lista de players
    ///valores recebidos
    
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
    
    
    
    ///func que verifica estado da sesssion
    private func verifyStatusSession(){
        
    }
    
//    ///
//    private func newParticipant(){
//
//    }
}

