//
//  WalksController.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 11.01.2024.
//

import Foundation

class WalksController {
    let walks = [
        Walk(
            title: "Bottle Lake Forest",
            image: "trash",
            imageDescription: """
            Forest with tall trees and sunlight coming through the branches.
            """,
            description: """
            Great place to walk on a hot day as the track is almost entirely in the shade.
            """,
            length: Measurement(value: 11.4, unit: .kilometers),
            elevation: Measurement(value: 160, unit: .meters),
            duration: Measurement(value: 2, unit: .hours)
        ),
        Walk(
            title: "Avon River Trail",
            image: "pencil",
            imageDescription: """
            Avon river in summer with green trees on the sides
            """,
            description: """
            Shared-use trail for cyclists and pedestrians that goes through the center of Christchurch.
            """,
            length: Measurement(value: 11, unit: .kilometers),
            elevation: Measurement(value: 26, unit: .meters),
            duration: Measurement(value: 2.5, unit: .hours)
        ),
        Walk(
            title: "Crater Rim Walkway",
            image: "folder",
            imageDescription: """
            View over the harbor from the Crater Rim walkway
            """,
            description: """
            Challenging route with beautiful views over Lyttelton Harbour.
            """,
            length: Measurement(value: 16.3, unit: .kilometers),
            elevation: Measurement(value: 620, unit: .meters),
            duration: Measurement(value: 5, unit: .hours)
        ),
        Walk(
            title: "Hagley Park Loop",
            image: "tray",
            imageDescription: """
            Lake with waterbirds next to a walkway in the park
            """,
            description: """
            Popular trail for hiking and road biking, but can be quiet during the work hours.
            """,
            length: Measurement(value: 5.8, unit: .kilometers),
            elevation: Measurement(value: 92, unit: .meters),
            duration: Measurement(value: 1, unit: .hours)
        )
    ]
}
