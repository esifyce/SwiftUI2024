//
//  WalkDurationChart.swift
//  SwiftUIInAnEmbeddedView
//
//  Created by Krasivo on 11.01.2024.
//

import SwiftUI
import Charts

struct WalkDurationChart: View {
    @ObservedObject var walkDurations: WalkDurations
    
    private var durationsToChart: [WalkDuration] {
        if walkDurations.sortingIsOn {
            return walkDurations.sorted
        } else {
            return walkDurations.original
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("Nature walk durations in hours:")
                .font(.caption)
            Chart(durationsToChart, id: \.title) { walk in
                BarMark(x: .value("Duration", PlottableMeasurement(measuremment: walk.duration)),
                        y: .value("Walk", walk.title))
            }
            .chartXAxis {
                AxisMarks { value in
                    if let duration = value.as(PlottableMeasurement.self)?.measuremment {
                        AxisValueLabel(duration.formatted())
                    }
                }
            }
            .animation(.default, value: walkDurations.sortingIsOn)
        })
    }
}

struct WalkDurationsChart_Previews: PreviewProvider {
    private static var durations: WalkDurations {
        let result = WalkDurations()
        result.original = WalksController().walks
            .map {
                WalkDuration(
                    title: $0.title,
                    duration: $0.duration
                )
            }
        return result
    }
    
    static var previews: some View {
        if #available(iOS 16, *) {
            WalkDurationChart(walkDurations: durations)
                .frame(height: 300)
                .padding()
        } else {
            Text("The chart is only available in iOS 16")
        }
    }
}
