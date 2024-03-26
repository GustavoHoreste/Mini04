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
    
    var multiVM: MultiplayerManagerViewModel
    var partialResultVM = PartialResultViewModel()
    var navigationCoordinator: Coordinator
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Player>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Player>
    
    var collection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 280, height: 90)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .systemBackground
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(PartialResultCell.self, forCellWithReuseIdentifier: PartialResultCell.identifier)
        return collection
    }()
    
    var dataSource: DataSource!
    var snapshot = DataSourceSnapshot()
    
    var data: [Player]
    
    init(multiVM: MultiplayerManagerViewModel, navigationCoordinator: Coordinator) {
        self.multiVM = multiVM
        self.navigationCoordinator = navigationCoordinator
        self.data = self.multiVM.adversaryPlayers
        self.data.append(self.multiVM.localPlayer!)
        partialResultVM.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partialResultVM.view = self
        configureCollectionViewDataSource()
        applySnapshot(players: partialResultVM.data)
        setupView()
        
        
//        print("Removendo do navigationcontroller: \(String(describing: navigationController?.viewControllers.count))")

        navigationController?.viewControllers.remove(at: (navigationController?.viewControllers.count)! - 2)
    
        
//        print("Removendo do navigationcontroller: \(String(describing: navigationController?.viewControllers.count))")
//        
//        print("Removendo do navigationcontroller: \(String(describing: navigationController?.viewControllers))")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.viewControllers.remove(at:  (navigationController?.viewControllers.count)! - 2)
        
//        print(navigationController?.viewControllers as Any)
    }
    
    private func configureCollectionViewDataSource() {
        dataSource = DataSource(collectionView: collection, cellProvider: { (collectionView, indexPath, player) -> PartialResultCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PartialResultCell.identifier, for: indexPath) as! PartialResultCell
            cell.playerName.text = player.userName
            cell.playerScore.text = String(player.points)
            return cell
        })
    }
    
    func applySnapshot(players: [Player]) {
        snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(players)
        dataSource.apply(snapshot,animatingDifferences: true)
    }
}
