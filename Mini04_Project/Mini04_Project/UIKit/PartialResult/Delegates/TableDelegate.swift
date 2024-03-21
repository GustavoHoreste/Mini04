//
//  File.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 20/03/24.
//

import UIKit

extension PartialResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartialResultCell.identifier, for: indexPath) as! PartialResultCell
        cell.playerName.text = testdata[indexPath.row].playerName
        cell.playerScore.text = String(testdata[indexPath.row].playerScore)
        cell.position.text = String(indexPath.row)
        return cell
    }
    
}
