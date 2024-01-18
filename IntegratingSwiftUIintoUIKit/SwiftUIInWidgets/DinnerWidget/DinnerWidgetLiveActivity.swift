//
//  DinnerWidgetLiveActivity.swift
//  DinnerWidget
//
//  Created by Krasivo on 15.01.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DinnerWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct DinnerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DinnerWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension DinnerWidgetAttributes {
    fileprivate static var preview: DinnerWidgetAttributes {
        DinnerWidgetAttributes(name: "World")
    }
}

extension DinnerWidgetAttributes.ContentState {
    fileprivate static var smiley: DinnerWidgetAttributes.ContentState {
        DinnerWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: DinnerWidgetAttributes.ContentState {
         DinnerWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: DinnerWidgetAttributes.preview) {
   DinnerWidgetLiveActivity()
} contentStates: {
    DinnerWidgetAttributes.ContentState.smiley
    DinnerWidgetAttributes.ContentState.starEyes
}
