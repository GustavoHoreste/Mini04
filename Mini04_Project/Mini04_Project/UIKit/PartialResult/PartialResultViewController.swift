//
//  PartialResultViewController.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import UIKit

enum Section {
    case main
}

class PartialResultViewController: UIViewController {
    
    var partialResultVM = PartialResultViewModel()
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, player>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, player>
    
    
    var collection: UICollectionView = {
        let collection = UICollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(PartialResultCell.self, forCellWithReuseIdentifier: PartialResultCell.identifier)
        return collection
    }()
    
    private var dataSource: DataSource!
    private var snapshot = DataSourceSnapshot()
    
    var data:[Player]
    
    init(data: [Player]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partialResultVM.view = self
        configureCollectionViewDataSource()
        setupView()
    }
    
    private func configureCollectionViewDataSource() {
        dataSource = DataSource(collectionView: collection, cellProvider: { (collectionView, indexPath, player) -> PartialResultCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PartialResultCell.identifier, for: indexPath) as! PartialResultCell
            cell.playerName.text = player.playerName
            cell.playerScore.text = String(player.playerScore)
            return cell
        })
    }
    
    func applySnapshot(players: [player]) {
        snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(players)
        dataSource.apply(snapshot,animatingDifferences: true)
    }
}



struct player: Hashable{
    var playerName:String
    var playerScore:Int
}
