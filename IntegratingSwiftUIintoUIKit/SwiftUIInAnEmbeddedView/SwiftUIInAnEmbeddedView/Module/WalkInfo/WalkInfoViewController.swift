//
//  WalkInfoViewController.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 12.01.2024.
//

import SwiftUI

class WalkInfoViewController: UIHostingController<WalkInfoWrapperView> {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.invalidateIntrinsicContentSize()
    }
}
