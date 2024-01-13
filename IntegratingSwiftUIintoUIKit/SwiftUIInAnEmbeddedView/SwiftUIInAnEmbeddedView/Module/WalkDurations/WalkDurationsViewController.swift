//
//  WalkDurationsViewController.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 11.01.2024.
//

import UIKit
import SwiftUI

class WalkDurationsViewController: UIViewController {
    var walks: [Walk] = [] {
        didSet {
            walkDurations.original = walks.map {
                WalkDuration(title: $0.title, duration: $0.duration)
            }
        }
    }
    
    private let walksController = WalksController()
    let walkDurations = WalkDurations()
    
    var scrollView: UIScrollView!
    var shortestWalkHeaderLabel: UILabel!
    var shortestWalkLabel: UILabel!
    var longestWalkHeaderLabel: UILabel!
    var longestWalkLabel: UILabel!
    var sortDurationsSwitch: UISwitch!
    var sortDurationsSwitchStack: UIStackView!
    
    var durationsStack: UIStackView?
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupScrollView()
        
        addShortestWalkLabels()
        addLongestWalkLabels()
        addSortDurationsSwitch()
        
        if #available(iOS 16, *) {
            addWalkInfo()
           // addDurationChart()
        } else {
            addDurationsStack()
        }
    }
    
    private func addDurationChart() {
        let chartView = WalkDurationChart(walkDurations: walkDurations)
        let chartController = UIHostingController(rootView: chartView)
        addChild(chartController)
        scrollView.addSubview(chartController.view)
        chartController.didMove(toParent: self)
        
        chartController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                 chartController.view.topAnchor.constraint(
                     equalTo: sortDurationsSwitchStack.bottomAnchor,
                     constant: 20
                 ),
                 chartController.view.leadingAnchor.constraint(
                     equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                     constant: 14
                 ),
                 chartController.view.trailingAnchor.constraint(
                     equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                     constant: -14
                 ),
                 chartController.view.bottomAnchor.constraint(
                     equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                     constant: -14
                 ),
                 chartController.view.heightAnchor.constraint(
                     greaterThanOrEqualToConstant: 300
                 )
             ])
    }
    
    private func addWalkInfo() {
        let view = WalkInfoWrapperView(walk: walksController.walks[0])
        let controller = UIHostingController(rootView: view)
        addChild(controller)
        scrollView.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(
                     equalTo: sortDurationsSwitchStack.bottomAnchor,
                     constant: 20
                 ),
            controller.view.leadingAnchor.constraint(
                     equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                     constant: 14
                 ),
            controller.view.trailingAnchor.constraint(
                     equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                     constant: -14
                 ),
            controller.view.bottomAnchor.constraint(
                     equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                     constant: -14
                 ),
            controller.view.heightAnchor.constraint(
                     greaterThanOrEqualToConstant: 300
                 )
             ])
        
    }
    
    private func updateDurationsStack() {
        guard let durationsStack = durationsStack else { return }
        
        let walksToShow = walkDurations.sortingIsOn
            ? walkDurations.sorted : walkDurations.original
    
        for (subview, walk) in zip(
            durationsStack.arrangedSubviews, walksToShow
        ) {
            if let label = subview as? UILabel {
                label.text = "\(walk.title): \(walk.duration)"
            }
        }
    }
    
    func sortingChanged(_ action: UIAction) {
        walkDurations.sortingIsOn = sortDurationsSwitch.isOn
        updateDurationsStack()
    }
    
    @IBAction func dismissDurations(_ sender: Any) {
        dismiss(animated: true)
    }
}

