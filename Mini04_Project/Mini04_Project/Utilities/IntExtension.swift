//
//  IntExtension.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 10/04/24.
//

import Foundation

extension Int {
    func converterPontos(tempoObj: CGFloat)-> Int {
        switch CGFloat(self) {
        case let value where value >= 0 && value <= tempoObj * 0.2:
            return 7
        case let value where value > tempoObj * 0.2 && value <= tempoObj * 0.4:
            return 10
        case let value where value > tempoObj * 0.4 && value <= tempoObj * 0.6:
            return 13
        case let value where value > tempoObj * 0.6 && value <= tempoObj * 0.8:
            return 16
        case let value where value > tempoObj * 0.8 && value <= tempoObj * 1:
            return 20
        default:
            print("NENHUMA CONDICAO PONTOS")
            return 0
        }
    }
}
