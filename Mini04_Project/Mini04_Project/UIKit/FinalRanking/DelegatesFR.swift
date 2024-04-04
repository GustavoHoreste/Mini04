//
//  DelegatesFR.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import Foundation

extension FinalViewModel {
    func setupDelegates() {
        leave.delegate = self
        recomecar.delegate = self
    }
}

extension FinalViewModel: ResultMenuButtonDelegate {
    func menuAction() {
        print("ACAO LEAVE")
    }
    
    
}

extension FinalViewModel: SingleRecButtonDelegate {
    func recomecarAction() {
        print("ACAO RECOMECAR")
    }
    
    
}
