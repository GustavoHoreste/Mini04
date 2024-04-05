//
//  HowToPlayView.swift
//  Mini04_Project
//
//  Created by GABRIEL Ferreira Cardoso on 04/04/24.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ScrollView {
            VStack{
                Text("Como Usar o SharePlay no Nosso App")
                    .font(.custom("FafoSans-Bold", size: 24))
                    .padding()

                Text("1. Convidando Alguém para Jogar:")
                    .font(.custom("FafoSans-Regular", size: 20)) // Usando a fonte personalizada FafoSans-Regular
                    .padding()
                Text("Se você deseja convidar alguém para jogar, você precisa ser o anfitrião. Siga estes passos simples:")
                    .font(.custom("FafoSans-Regular", size: 20))

                Text("Como Anfitrião, inicie o nosso aplicativo e clique no botão \"Criar Jogo\".")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Agora, você pode convidar outras pessoas para jogar com você.")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Clique no botão \"Convidar\" e selecione todos os amigos que deseja convidar.")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Escolha a opção de mensagens ou FaceTime para enviar os convites.")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Seus amigos precisarão aceitar o convite através da mensagem ou FaceTime.")
                    .font(.custom("FafoSans-Regular", size: 20))

                Text("2. Entrando em um Jogo:")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Se você deseja entrar em um jogo sem ser o anfitrião, siga estes passos:")
                    .font(.custom("FafoSans-Regular", size: 20))

                Text("Aguarde o convite do anfitrião via mensagem ou FaceTime.")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Aceite o convite para entrar no jogo.")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Uma vez dentro da sessão, você verá um botão de \"Iniciar\" quando todos estiverem prontos.")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Depois que o anfitrião iniciar o jogo, você verá uma notificação para se juntar.")
                    .font(.custom("FafoSans-Regular", size: 20))
                
                Text("Clique na notificação para entrar na partida.")
                    .font(.custom("FafoSans-Regular", size: 20))

                Text("3. No Lobby do Jogo:")
                    .font(.custom("FafoSans-Regular", size: 20))
                    .padding()
                Text("Quando todos estiverem dentro da sessão, você estará no lobby do jogo. Aqui estão algumas coisas que você pode fazer:")
                    .font(.custom("FafoSans-Regular", size: 20))

                Text("Certifique-se de que todos estejam prontos para jogar.")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Quando estiver pronto, clique no botão \"Ready\".")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("O jogo só começará quando todos os participantes estiverem prontos e o anfitrião der início.")
                    .font(.custom("FafoSans-Regular", size: 20))

                Text("4. Começando o Jogo:")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Uma vez que todos estejam prontos e o anfitrião tenha iniciado o jogo, a diversão começará!")
                    .font(.custom("FafoSans-Regular", size: 20))
                Text("Siga as instruções do jogo e aproveite a experiência do SharePlay com seus amigos!")
                    .font(.custom("FafoSans-Regular", size: 20))

            }
        }
    }
}

#Preview {
    HowToPlayView()
}
