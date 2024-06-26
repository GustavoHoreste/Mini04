//
//  PartialResultViewController.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import UIKit
import Combine

enum Section {
    case main
}

class PartialResultViewController: UIViewController {
    
    var multiVM: MultiplayerManagerViewModel
    var partialResultVM = PartialResultViewModel()
    var navigationCoordinator: Coordinator
    var gameplayVM: GameplayViewModel
    var haptics = Haptics()
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Player>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Player>
    
    var collection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 360, height: 120)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(PartialResultCell.self, forCellWithReuseIdentifier: PartialResultCell.identifier)
        return collection
    }()
    
    var dataSource: DataSource!
    var snapshot = DataSourceSnapshot()
    
    var data: [Player]
    var players: [Player]?
    
    init(multiVM: MultiplayerManagerViewModel, navigationCoordinator: Coordinator, gameplayVM: GameplayViewModel) {
        self.multiVM = multiVM
        self.navigationCoordinator = navigationCoordinator
        self.gameplayVM = gameplayVM
        self.data = self.multiVM.adversaryPlayers
        self.data.append(self.multiVM.localPlayer!)
        partialResultVM.data = data
        super.init(nibName: nil, bundle: nil)
        
        partialResultVM.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.partialResultVM.cinfigureLabelReadyButton()
        
        self.partialResultVM.verifyIsHost()
        
        self.partialResultVM.funcStartCombine()
        
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.gameplayVM.starCombine()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        partialResultVM.logo.isHidden = false
    }
    
    public func configureParcialVC(){
        self.players = multiVM.adversaryPlayers
        self.players?.append(multiVM.localPlayer!)
        
        configureCollectionViewDataSource()
        applySnapshot(players: players!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){ [self] in
            partialResultVM.logo.sizeDecrease()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4){ [self] in
            self.starAnimation()
            partialResultVM.logo.sizeDecrease()
        }
    }
    
    public func starAnimation(){
        let sortData = players?.sorted{$0.points > $1.points}
        configureCollectionViewDataSource()
        applySnapshot(players: sortData!)
    }
    
    private func configureCollectionViewDataSource() {
        dataSource = DataSource(collectionView: collection, cellProvider: { (collectionView, indexPath, player) -> PartialResultCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PartialResultCell.identifier, for: indexPath) as! PartialResultCell
            cell.playerName.text = player.userName
            cell.playerScore.text = String(player.points)
            cell.changePositionBG(indexPath.row)
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
