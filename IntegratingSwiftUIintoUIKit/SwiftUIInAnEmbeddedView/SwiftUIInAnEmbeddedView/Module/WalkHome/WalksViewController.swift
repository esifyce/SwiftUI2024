//
//  WalksViewController.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 11.01.2024.
//

import UIKit

class WalksViewController: UIViewController, UICollectionViewDelegate {
    enum Section: CaseIterable {
        case main
    }
    
    private let walksController = WalksController()
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Walk>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Nature Walks"
        navigationItem.rightBarButtonItem = .init(systemItem: .action, primaryAction: UIAction(handler: { [weak self] _ in
            self?.showDuration()
        }))
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        collectionView = UICollectionView(
            frame: view.bounds, collectionViewLayout: layout
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        configureDataSource()
        updateUI()
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView
            .CellRegistration<UICollectionViewListCell, Walk>
        { (cell, indexPath, walk) in
            var content = cell.defaultContentConfiguration()
            
            content.text = walk.title
            content.secondaryText = walk.description
            
            cell.contentConfiguration = content
            cell.accessibilityTraits = [.button]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Walk>(
            collectionView: collectionView
        ) { (collectionView, indexPath, walk) in
            let walkCell = collectionView
                .dequeueConfiguredReusableCell(
                    using: cellRegistration, for: indexPath, item: walk
                )
            
            return walkCell
        }
    }
    
    private func updateUI() {
        let walks = walksController.walks
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Walk>()
        snapshot.appendSections([.main])
        snapshot.appendItems(walks, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard
            let walk = dataSource.itemIdentifier(for: indexPath)
        else { return }
        let detailController = WalkDetailViewController()
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        detailController.walk = walk
        detailController.navigationItem.title = walk.title
        navigationController?.pushViewController(
            detailController, animated: true
        )
    }
    
    func showDuration() {
        let controller = WalkDurationsViewController()
        self.present(controller, animated: true)
    }
    
    @IBSegueAction func showDurations(_ coder: NSCoder) -> UINavigationController? {
        let navigationController = UINavigationController(coder: coder)
        if let durationsController = navigationController?
            .topViewController as? WalkDurationsViewController
        {
            durationsController.walks = walksController.walks
        }
        
        return navigationController
    }
}
