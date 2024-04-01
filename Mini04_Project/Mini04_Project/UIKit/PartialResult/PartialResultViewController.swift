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
    
    private var cancellables = Set<AnyCancellable>()
    private var newFinishGame: FinishGame?{
        didSet{
            if newFinishGame != nil{
                backLobby()
                newFinishGame = nil
            }
        }
    }
    private var hostIsStarter: Bool = false{
        didSet{
            if hostIsStarter != false{
                nextRound()
                hostIsStarter = false
            }
        }
    }
    
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
        
        self.cinfigureLabelReadyButton()
        
        self.multiVM.$newFinishGame
            .assign(to: \.newFinishGame, on: self)
            .store(in: &cancellables)
        
        self.multiVM.$hostIsStarter
            .assign(to: \.hostIsStarter, on: self)
            .store(in: &cancellables)
        
        self.verifyIsHost()
        
        self.multiVM.resetPointAndStatus()
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
        
        navigationController?.viewControllers.remove(at: (navigationController?.viewControllers.count)! - 2)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.viewControllers.remove(at:  (navigationController?.viewControllers.count)! - 2)
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
    
    
    private func backLobby(){
        self.navigationCoordinator.push(.lobby)
    }
    
    private func nextRound(){
        let nextScreen = GameplayViewController(multiVM: self.multiVM, navigationCoordinator: self.navigationCoordinator)
        nextScreen.gameplayVM.round.number = partialResultVM.currentRound + 1
        self.navigationController?.pushViewController(nextScreen, animated: false)
    }
    
    private func verifyIsHost(){
        if multiVM.localPlayer?.isHost == true{
            partialResultVM.endGameButton.diableButton()
        }
    }
    
    private func cinfigureLabelReadyButton(){
        let userIsHost = self.multiVM.localPlayer?.isHost
        self.partialResultVM.readyButton.witchLabel(userIsHost!)
    }
}
