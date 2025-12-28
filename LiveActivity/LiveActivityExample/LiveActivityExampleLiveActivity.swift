//
//  LiveActivityExampleLiveActivity.swift
//  LiveActivityExample
//
//  Created by 김재영 on 12/28/25.
//

import ActivityKit
import WidgetKit
import SwiftUI



struct LiveActivityExampleLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivityExampleAttributes.self) { context in
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

extension LiveActivityExampleAttributes {
    fileprivate static var preview: LiveActivityExampleAttributes {
        LiveActivityExampleAttributes(name: "World")
    }
}

extension LiveActivityExampleAttributes.ContentState {
    fileprivate static var smiley: LiveActivityExampleAttributes.ContentState {
        LiveActivityExampleAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LiveActivityExampleAttributes.ContentState {
         LiveActivityExampleAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LiveActivityExampleAttributes.preview) {
   LiveActivityExampleLiveActivity()
} contentStates: {
    LiveActivityExampleAttributes.ContentState.smiley
    LiveActivityExampleAttributes.ContentState.starEyes
}
