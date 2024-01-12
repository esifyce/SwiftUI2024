//
//  File.swift
//  SwiftUISeparateViewController
//
//  Created by Krasivo on 11.01.2024.
//

import UIKit
import SwiftUI
import Combine

class ExercisesViewController: UIViewController, UICollectionViewDelegate {
    enum Section: CaseIterable {
        case main
    }
    
    private let exercisesController = ExercisesController()
    private let filterState = ExerciseFilterState()
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Exercise>!
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Training Exercises"
        navigationItem.rightBarButtonItem = .init(systemItem: .add, primaryAction: UIAction(handler: { [weak self] _ in
            guard let self else { return }
            self.present(showFilter(), animated: true)
        }))
        
        navigationItem.leftBarButtonItem = .init(systemItem: .bookmarks, primaryAction: UIAction(handler: { [weak self] _ in
            guard let self else { return }
            self.present(showTrainingGuidelines(), animated: true)
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
        
        cancellable = filterState.$selection
            .sink { [weak self] selection in
                if selection != self?.filterState.selection {
                    self?.updateUI(animated: true, filterSelection: selection)
                }
            }
        updateUI(animated: false)
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView
            .CellRegistration<UICollectionViewListCell, Exercise>
        { (cell, indexPath, exercise) in
            var content = cell.defaultContentConfiguration()
            content.text = exercise.title
            content.secondaryText = exercise.description
            cell.contentConfiguration = content
            cell.accessibilityTraits = [.button]
            cell.accessibilityHint = "Navigate to the exercise detail view"
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Exercise>(
            collectionView: collectionView
        ) { (collectionView, indexPath, exercise) in
            let exerciseCell = collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: exercise
            )
            
            return exerciseCell
        }
    }
    
    private func updateUI(animated: Bool, filterSelection: Exercise.Difficulty? = nil) {
        let exercises = exercisesController.exercises
            .filter { exercise in
                filterSelection.map({ $0 == exercise.difficulty }) ?? true
            }
        var snapshot = NSDiffableDataSourceSnapshot<Section, Exercise>()
        snapshot.appendSections([.main])
        snapshot.appendItems(exercises, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard let exercise = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let detailView = ExerciseDetail(exercise: exercise)
        let detailController = UIHostingController(rootView: detailView)
        detailController.navigationItem.title = exercise.title
        navigationController?.pushViewController(detailController, animated: true)
        
        print("did select exercise: \(exercise.title)")
    }
    
    func showFilter() -> UIViewController {
        let filterView = ExerciseFilterView(filterState: filterState)
        let controller = UIHostingController(rootView: filterView)
        controller.sheetPresentationController?.detents = [
            .medium()
        ]
        return controller
    }
    
    func showTrainingGuidelines() -> UIViewController {
        let trainingGuidelinesView = TrainingGuidelinesView()
        let controller = TrainingGuidelinesViewController(rootView: trainingGuidelinesView)
        return controller
    }
}
