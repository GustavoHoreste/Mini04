//
//  FianlResultViewModel.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 02/04/24.
//

import Foundation

class FinalResultViewModel: ObservableObject {
    @Published var data:[Player] = []{
        didSet{
            data = data.sorted(by: {$0.points > $1.points})
            tops = data[...2]
        }
    }
    var tops:ArraySlice<Player> = []
    
    
}
