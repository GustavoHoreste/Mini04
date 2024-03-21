//
//  PartialResultViewController.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import UIKit

class PartialResultViewController: UIViewController {
    
    var partialResultVM = PartialResultViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.register(PartialResultCell.self, forCellReuseIdentifier:PartialResultCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.rowHeight = 110
        tableView.estimatedRowHeight = 110
        return tableView
    }()
    
    var testdata = [
        player(playerName: "teste", playerScore: 2000),
        player(playerName: "teste2", playerScore: 2100),
        player(playerName: "teste3", playerScore: 2200),
        player(playerName: "teste4", playerScore: 2300),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}



struct player{
    var playerName:String
    var playerScore:Int
}
