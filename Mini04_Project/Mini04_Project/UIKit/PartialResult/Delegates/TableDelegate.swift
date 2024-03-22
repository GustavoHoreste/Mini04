//
//  File.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 20/03/24.
//

import UIKit

extension PartialResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartialResultCell.identifier, for: indexPath) as! PartialResultCell
        cell.playerName.text = data[indexPath.row].userName
        cell.playerScore.text = String(data[indexPath.row].points)
        cell.position.text = String(indexPath.row)
        return cell
    }
}
