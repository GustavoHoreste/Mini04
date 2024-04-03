//
//  ShareInviteSheet.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 18/03/24.
//

import UIKit
import SwiftUI
import GroupActivities

//struct ShareInviteSheet: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIActivityViewController {
//        let itemProvider = NSItemProvider()
//        itemProvider.registerGroupActivity(WhereWhereActivity())
//
//        let configuration = UIActivityItemsConfiguration(itemProviders: [itemProvider])
//        return UIActivityViewController(activityItemsConfiguration: configuration)
//    }
//
//    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
//}

struct ShareInviteSheet: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> GroupActivitySharingController {
        return try! GroupActivitySharingController(WhereWhereActivity())
        //GroupActivityTransferRepresentation
    }

    func updateUIViewController(_ uiViewController: GroupActivitySharingController, context: Context) { }
}
