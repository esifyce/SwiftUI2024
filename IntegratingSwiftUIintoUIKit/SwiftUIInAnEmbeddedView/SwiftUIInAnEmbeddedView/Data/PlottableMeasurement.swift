//
//  PlottableMeasurement.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 11.01.2024.
//

import Foundation
import Charts

struct PlottableMeasurement<UnitType: Unit> {
    var measuremment: Measurement<UnitType>
}

extension PlottableMeasurement: Plottable where UnitType == UnitDuration {
    
    var primitivePlottable: Double {
        self.measuremment.converted(to: .hours).value
    }
    
    init?(primitivePlottable: Double) {
        self.init(measuremment: Measurement(value: primitivePlottable, unit: .hours))
    }
}
