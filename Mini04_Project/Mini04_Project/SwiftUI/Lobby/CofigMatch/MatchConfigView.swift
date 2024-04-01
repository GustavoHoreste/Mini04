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
            return "\(minutes):00"
        } else {
            return "\(minutes):\(seconds)"
        }
    }
}

class MatchConfigViewModel: ObservableObject{
    private var multiplayerVM: MultiplayerManagerViewModel?
    private var selectTypeUser: ParticipantType = .player
    
    @Published public var coresIsChoise: Bool = false
    @Published public var selectPowerUps: Bool = true
    @Published var selectedRound: Round = .one
    @Published var selectedRoundTime: RoundTime = .oneThirtyMinutes
    
    
    public func saveConfigMach() {
        let config: MatchConfig = MatchConfig(roundTime: selectedRoundTime.rawValue,
                                                   amoutRound: selectedRound.rawValue,
                                                   powerUps: selectPowerUps,
                                                   coresIsChoise: coresIsChoise)
        self.multiplayerVM?.defineMachConfig(config)
    }
    
    public func reset() {
        selectTypeUser = .player
        coresIsChoise = false
        selectPowerUps = true
        selectedRound = .one
        selectedRoundTime = .oneThirtyMinutes
    }
    
    
    public func addVM(multiplayerVM: MultiplayerManagerViewModel){
        self.multiplayerVM = multiplayerVM
    }
}

struct MatchConfigView: View {
    @StateObject private var matchConfigVM: MatchConfigViewModel = MatchConfigViewModel()
    @EnvironmentObject private var multiplayerVM: MultiplayerManagerViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack{
            Spacer()

                HStack {
                    Text("Rodadas")
                    Spacer()
                    Picker("Round", selection: $matchConfigVM.selectedRound) {
                        ForEach(Round.allCases, id: \.self) { round in
                            Text("\(round.rawValue)")
                        }
                    }.pickerStyle(.menu)
                        .tint(.black)
                        .background(.gray)
                }
                
                
                HStack {
                    Text("Tempo")
                    Spacer()
                    Picker("Round", selection: $matchConfigVM.selectedRoundTime) {
                        ForEach(RoundTime.allCases, id: \.self) { roundTime in
                            Text("\(roundTime.minutes)")
                        }
                    }.pickerStyle(.menu)
                        .tint(.black)
                        .background(.gray)
                }
            
            
            Toggle("Bônus de habilidade", isOn: $matchConfigVM.selectPowerUps)
            
            Toggle("Cores", isOn: $matchConfigVM.coresIsChoise)
            
            Spacer()
            
            Button{ matchConfigVM.saveConfigMach()} label: {
                Text("Confirmar")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .font(.title2)
            }
            
            Button{ matchConfigVM.reset()} label: {
                Text("Cancelar")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
                    .font(.title2)
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
