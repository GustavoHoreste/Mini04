//
//  FinalRakingViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 04/04/24.
//

import UIKit

class FinalRakingViewController: UIViewController {

    var navigationCoordinator: Coordinator
    var finalVM = FinalViewModel()
    var multiVM: MultiplayerManagerViewModel
    
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
        collection.register(NormalListCell.self, forCellWithReuseIdentifier: NormalListCell.identifier)
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
        self.finalVM.data = data.sorted(by: {$0.points > $1.points})
        print(finalVM.topPlayers)
        super.init(nibName: nil, bundle: nil)
        finalVM.setupTopRanks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func readyButtonIsHiden(){
        if multiVM.localPlayer?.isHost == false {
            self.finalVM.recomecar.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalVM.view = self
        
        setupView()
        configureCollectionViewDataSource()
        applySnapshot(players: finalVM.dataForCollection)
        finalVM.setupTopRanks()
        print("THIRD ISHIDDEN \(finalVM.userThird.isHidden.description)")
        
        self.finalVM.starCombine()
        self.readyButtonIsHiden()
    }

    private func configureCollectionViewDataSource() {
        dataSource = DataSource(collectionView: collection, cellProvider: { (collectionView, indexPath, player) -> NormalListCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalListCell.identifier, for: indexPath) as! NormalListCell
            cell.playerName.text = player.userName
            cell.playerScore.text = String(player.points)
            cell.changePositionBG(indexPath.row + 4)
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
