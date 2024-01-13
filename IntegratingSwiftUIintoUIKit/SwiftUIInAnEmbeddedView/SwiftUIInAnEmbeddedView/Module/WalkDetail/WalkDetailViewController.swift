//
//  WalkDetailViewController.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 11.01.2024.
//

import UIKit

class WalkDetailViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        UIImageView()
    }()
    
    private lazy var descriptionLabel: UILabel = {
        UILabel()
    }()
    
    var walk: Walk!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        imageView.image = UIImage(systemName: walk.image)
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .none
        imageView.accessibilityLabel = walk.imageDescription
        descriptionLabel.text = walk.description
        UIAccessibility.post(
            notification: UIAccessibility.Notification.screenChanged,
            argument: self.imageView
        )
    }
}

