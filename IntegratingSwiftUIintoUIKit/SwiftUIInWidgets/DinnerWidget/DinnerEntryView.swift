//
//  DinnerEntryView.swift
//  DinnerWidgetExtension
//
//  Created by Krasivo on 15.01.2024.
//

import SwiftUI
import WidgetKit

struct DinnerWidgetEntryView: View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family

    var body: some View {
        if #available(iOSApplicationExtension 16.0, *) {
            switch family {
            case .accessoryRectangular:
                AccessoryDinnerWidgetView(entry: entry)
            case .systemSmall:
                SmallDinnerWidgetView(entry: entry)
            default:
                MediumDinnerWidgetView(entry: entry)
            }
        } else {
            switch family {
            case .systemSmall:
                SmallDinnerWidgetView(entry: entry)
            default:
                MediumDinnerWidgetView(entry: entry)
            }
        }
    }
}

struct SmallDinnerWidgetView: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            Spacer()
            
            TimeUntilDinnerView(dinnerDate: entry.dinnerDate)
                .padding(10)
                .background(
                    Rectangle().fill(.ultraThinMaterial)
                )
        }
        .widgetBackground(
            RecipeImage(
                recipe: entry.recipe
            )
        )
    }
}

struct MediumDinnerWidgetView: View {
    var entry: Provider.Entry
    
    var body: some View {
        HStack {
            Link(destination: RecipeController.recipeUrl) {
                RecipeImage(recipe: entry.recipe)
            }
            VStack(alignment: .leading, spacing: 20, content: {
                Text(entry.recipe.name)
                    .font(.headline)
                TimeUntilDinnerView(dinnerDate: entry.dinnerDate)
            })
            .padding()
        }
        .secondaryWidgetBackground()
    }
}

@available(iOSApplicationExtension 16.0, *)
struct AccessoryDinnerWidgetView: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.recipe.name)
                .font(.headline)
                .minimumScaleFactor(0.6)
                .privacySensitive()
                
            TimeUntilDinnerView(dinnerDate: entry.dinnerDate)
        }
        .clearWidgetBackground()
    }
}
