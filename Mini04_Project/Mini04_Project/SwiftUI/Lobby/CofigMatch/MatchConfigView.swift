//
//  MatchConfigView.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 22/03/24.
//

import SwiftUI

enum Round: Int, CaseIterable, Identifiable {
    case one = 1, two, three, four, five
    
    var id: Self { self }
}

enum RoundTime: Double, CaseIterable, Identifiable, Codable {
    case thirtySeconds = 30.0
    case oneMinute = 60.0
    case oneThirtyMinutes = 90.0
    case twoMinutes = 120.0
    case twoThirtyMinutes = 150.0
    case threeMinutes = 180.0
    
    var id: Self { self }
    
    var minutes: String {
        let minutes = Int(self.rawValue) / 60
        let seconds = Int(self.rawValue) % 60
        if seconds == 0 {
            return "\(minutes)"
        } else {
            return "\(minutes):\(seconds)"
        }
    }
}

class MatchConfigViewModel: ObservableObject{
    private var multiplayerVM: MultiplayerManagerViewModel?
    private var selectTypeUser: ParticipantType = .player
    public var coresIsChoise: Bool = false
    private(set) var selectPowerUps: Bool = false
    
    @Published var selectedRound: Round = .three
    @Published var selectedRoundTime: RoundTime = .oneThirtyMinutes
    @Published var selectedWatch: Bool = false
    @Published var selecPlayer: Bool = false
    
    
    public func saveConfigMach() {
        let config: MatchConfig = MatchConfig(roundTime: selectedRoundTime.rawValue,
                                                   amoutRound: selectedRound.rawValue,
                                                   powerUps: selectPowerUps,
                                                   coresIsChoise: coresIsChoise)
        self.multiplayerVM?.defineMachConfig(config)
    }
    
    public func selectTypeUser(_ type: ParticipantType){
        self.selectTypeUser = type
    }
    
    
    public func defineSelectPowerUps(){
        self.selectPowerUps.toggle()
    }
    
    public func addVM(multiplayerVM: MultiplayerManagerViewModel){
        self.multiplayerVM = multiplayerVM
    }
}

struct MatchConfigView: View {
    @StateObject private var matchConfigVM: MatchConfigViewModel = MatchConfigViewModel()
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    
    var body: some View {
        VStack{
                        
            Spacer()
            
            Toggle("Jogar partida", isOn: $matchConfigVM.selectedWatch)
                .onChange(of: matchConfigVM.selectedWatch) { oldValue, newValue in
                    if newValue {
                        matchConfigVM.selecPlayer = false
                        matchConfigVM.selectTypeUser(.player)
                    }
                }
                .bold()
            
            Toggle("Assistir partida", isOn: $matchConfigVM.selecPlayer)
                .onChange(of: matchConfigVM.selecPlayer) { oldValue ,newValue in
                    if newValue {
                        matchConfigVM.selectedWatch = false
                        matchConfigVM.selectTypeUser(.espectetor)
                    }
                }
                .bold()
            
            
            HStack(alignment: .center) {
                VStack {
                    Text("Rodadas")
                    Picker("Round", selection: $matchConfigVM.selectedRound) {
                        ForEach(Round.allCases, id: \.self) { round in
                            Text("\(round.rawValue)")
                        }
                    }.pickerStyle(.menu)
                        .tint(.black)
                        .background(.gray)
                }
                
                
                VStack {
                    Text("Tempo")
                    Picker("Round", selection: $matchConfigVM.selectedRoundTime) {
                        ForEach(RoundTime.allCases, id: \.self) { roundTime in
                            Text("\(roundTime.minutes)")
                        }
                    }.pickerStyle(.menu)
                        .tint(.black)
                        .background(.gray)
                }
            }
            
            
            ToggleConfigComponent(textToggle: "Bônus de habilidade") {
                matchConfigVM.defineSelectPowerUps()
            }
            
            Text("A partida terá...")
            
            
            ToggleConfigComponent(textToggle: "Cores") {
                matchConfigVM.coresIsChoise.toggle()
                let _ = print(matchConfigVM.coresIsChoise)
            }
            
            Spacer()
            
            Button{ matchConfigVM.saveConfigMach() }label: {
                Text("Salvar alterações")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .clipShape(.capsule)
                    .font(.title)
            }
            
        }.padding()
            .onAppear{
                matchConfigVM.addVM(multiplayerVM: multiplayerVM)
            }
    }
}

#Preview {
    MatchConfigView()
        .environmentObject(MultiplayerManagerViewModel())
}
