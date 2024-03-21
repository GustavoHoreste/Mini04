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
        tableView.rowHeight = 90
        tableView.estimatedRowHeight = 90
        return tableView
    }()
    
    var data:[Player]!
    
    init(data: [Player]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}



struct player{
    var playerName:String
    var playerScore:Int
}
