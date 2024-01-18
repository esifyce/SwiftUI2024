//
//  DinnerWidget.swift
//  DinnerWidget
//
//  Created by Krasivo on 15.01.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> DinnerEntry {
        DinnerEntry.sampleEntry
    }

    func getSnapshot(in context: Context, completion: @escaping (DinnerEntry) -> ()) {
        if context.isPreview {
            let entry = DinnerEntry.sampleEntry
            completion(entry)
            return
        }
        Task {
            let entry = await fetchDinnerEntry()
            completion(entry)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<DinnerEntry>) -> ()) {
        Task {
            let entry = await fetchDinnerEntry()
            let timeline = Timeline(entries: [entry], policy: .after(entry.dinnerDate))
            completion(timeline)
        }
    }
    
    private func fetchDinnerEntry() async -> DinnerEntry {
           let date = Date()
           let dinnerTime = DinnerTimeController.getDinnerTime()
           let recipe = await RecipeController
               .getRecipeOfTheDay(for: dinnerTime)
           let dinnerDate = DinnerTimeController
               .nextDinnerDate(matching: dinnerTime)
           
           return DinnerEntry(
               date: date,
               recipe: recipe,
               dinnerDate: dinnerDate
           )
       }
}

struct DinnerWidget: Widget {
    let kind: String = "DinnerWidget"
    
    private var supportedFamilies: [WidgetFamily] {
          if #available(iOSApplicationExtension 16.0, *) {
              return [
                  .systemSmall, .systemMedium,
                  .accessoryRectangular
              ]
          } else {
              return [.systemSmall, .systemMedium]
          }
      }

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DinnerWidgetEntryView(entry: entry)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Dinner Widget")
        .description("""
Shows the dinner dish and the time until dinner
""")    .supportedFamilies(supportedFamilies)
    }
}

#Preview(as: .systemSmall) {
    DinnerWidget()
} timeline: {
    DinnerEntry.sampleEntry
}
