//
//  DelegatesFR.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import Foundation
import UIKit

extension FinalViewModel {
    func setupDelegates() {
        leave.delegate = self
        popUp.delegate = self
        recomecar.delegate = self
    }
}

extension FinalViewModel: ExitGameDelegate {
    func didTabButtun(_ tab: Int) {
        switch tab{
        case 1:
            self.anitionDismiss()
        case 0:
            self.anitionDismiss()
            self.view?.navigationCoordinator.push(.menu)
        default:
            print("Tag invalid")
        }
    }
    
    func exitGame() {
        self.haptics.doHaptic(type: .button)
        self.view?.present(popUp, animated: false)
    }
    
    
    func anitionDismiss(){
        UIView.animate(withDuration: 1, delay: 0.0,options: .curveEaseOut) {
            
        }completion: { _ in
            self.view?.dismiss(animated: false)
        }
    }
}

extension FinalViewModel: SingleRecButtonDelegate {
    func recomecarAction() {
        self.view?.multiVM.resetPowerUpsAndStatus()
        view?.navigationCoordinator.push(.lobby)
    }
}
