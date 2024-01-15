//
//  ActivitiesViewController.swift
//  SwiftUIInCollectionViewCells
//
//  Created by Krasivo on 12.01.2024.
//

import UIKit
import SwiftUI

class ActivitiesViewController: UIViewController {
    enum Section: CaseIterable {
        case main
    }
    
    private let activitiesController = ActivitiesController()
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Activity.ID>!
    private let cellColors: [Color] = [.indigo, .purple, .pink, .cyan, .mint, .blue, .teal]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Activities"
        navigationItem.rightBarButtonItem = .init(systemItem: .add, primaryAction: UIAction(handler: { [weak self] _ in
            self?.addNewActivity()
        }))
        
        let config = UICollectionLayoutListConfiguration(
            appearance: .insetGrouped
        )
        let layout = UICollectionViewCompositionalLayout
            .list(using: config)
        collectionView = UICollectionView(
            frame: view.bounds, collectionViewLayout: layout
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.allowsSelection = false
        view.addSubview(collectionView)
        
        configureDataSource()
        activitiesController.addDefaultActivities()
        updateUI()
    }

    private func configureDataSource() {
        let cellRegistration = UICollectionView
            .CellRegistration<UICollectionViewListCell, Activity>
        { [unowned self] (cell, indexPath, activity) in
            configureActivityCell(cell, for: activity, in: indexPath)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Activity.ID>(
            collectionView: collectionView
        ) { [unowned self] (collectionView, indexPath, activityID) in
            let activity = activitiesController.activity(for: activityID)!
            
            let activityCell = collectionView
                .dequeueConfiguredReusableCell(
                    using: cellRegistration, for: indexPath, item: activity
                )
            
            return activityCell
        }
    }
    
    private func configureActivityCell(
        _ cell: UICollectionViewListCell, for activity: Activity, in indexPath: IndexPath
    ) {
        let backgroundColor = cellColors[indexPath.row % cellColors.count]
        
        cell.configurationUpdateHandler = { cell, state in
            cell.contentConfiguration = UIHostingConfiguration(content: {
                ActivityCellView(activity: activity)
                    .swipeActions(edge: .trailing) {
                        MarkAsImportantButton(activity: activity)
                        Button(role: .destructive) { [weak self] in
                            self?.delete(activity: activity)
                        } label: {
                            Label(
                                "Delete",
                                systemImage: "trash"
                            )
                                .labelStyle(.iconOnly)
                        }
                    }
            })
            .margins(.horizontal, 12)
            .background(
                backgroundColor.opacity(state.isSwiped ? 0.3 : 0.2)
            )
        }
    }
    
    private func updateUI() {
        let activityIDs = activitiesController.activities
            .map { $0.id }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Activity.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(activityIDs, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func addNewActivity() {
        activitiesController.addActivity()
        updateUI()
    }
    
    func delete(activity: Activity) {
        activitiesController.delete(activity: activity)
        updateUI()
    }
}

