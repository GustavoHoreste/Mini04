//
//  SharePlayPresenter.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 18/03/24.
//

import SwiftUI
import Combine

//MARK: - Chamar a ShareplayInteractor
class SharePlayPresenter: ObservableObject{
    private var routes: Coordinator = Coordinator()
    
    public func present(_ sheet: Sheet){
        routes.present(sheet: sheet)
    }
}

