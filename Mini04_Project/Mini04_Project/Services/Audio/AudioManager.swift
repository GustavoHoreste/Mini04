//
//  AudioManager.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 21/03/24.
//

import Foundation
import AVFoundation

//Criar um case para cada áudio
enum Audio {
    case music
}

struct AudioManager {
    static var shared = AudioManager()
    
    //Declarar uma variável para cada áudio
    var music: AVAudioPlayer?
    
    //Função para preparar todos os áudios do jogo no init do aplicativo afins de evitar bugs
    mutating func prepareAllSounds() {
        //Fazer o seguinte para cada áudio adicionado:
        guard let pathClick = Bundle.main.path(forResource: "music", ofType: "mp3") else { return }
        let urlClick = URL(fileURLWithPath: pathClick)
        
        do {
            music = try AVAudioPlayer(contentsOf: urlClick)
            music?.prepareToPlay()
            music?.volume = 0.5
        } catch {
            print("Erro ao inicializar o AVAudioPlayer para momento específico: \(error.localizedDescription)")
        }
    }
     
    //Para executar um áudio basta usar AudioManager.shared.playSound()
    //O mesmo vale para o stopSound()
    func playSound(audio: Audio) {
        switch audio {
        case .music:
            music?.play()
        }
    }
    
    func stopSound(audio: Audio) {
        switch audio {
        case .music:
            music?.stop()
        }
    }
    
}
