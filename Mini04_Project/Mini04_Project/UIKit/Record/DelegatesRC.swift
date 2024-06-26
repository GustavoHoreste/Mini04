//
//  DelegatesRC.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 03/04/24.
//

import Foundation

extension RecordViewModel {
    func setupDelegate() {
        menu.delegate = self
//        restart.delegate = self
    }
}

extension RecordViewModel: ResultMenuButtonDelegate {
    func menuAction() {
        self.haptics.doHaptic(type: .button)
        controller?.navigationCoordinator.push(.menu)
    }
}

extension RecordViewModel: SingleRecButtonDelegate {
    func recomecarAction() {
        print("recACtion")
    }
}
