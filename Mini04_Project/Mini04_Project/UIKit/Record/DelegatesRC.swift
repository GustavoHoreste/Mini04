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
    }
}

extension RecordViewModel: ResultMenuButtonDelegate {
    func menuAction() {
        controller?.navigationCoordinator.push(.menu)
    }
}
