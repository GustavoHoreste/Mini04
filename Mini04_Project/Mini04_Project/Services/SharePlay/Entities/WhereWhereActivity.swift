//
//  WhereWhereActivity.swift
//  Mini04_Project
//
//  Created by Gustavo Horestee Santos Barros on 18/03/24.
//

import UIKit
import GroupActivities

//Configuração
struct WhereWhereActivity: GroupActivity{
    static let activityIdentifier: String = "WhereWhereActivity"
    
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Procurem juntos", comment: "Title of group Activity")
        metadata.subtitle = Date().formatted()
        metadata.previewImage = UIImage(resource: .logo).cgImage
        metadata.type = .generic
        return metadata
    }
}
