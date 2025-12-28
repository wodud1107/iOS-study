//
//  LiveActivityApp.swift
//  LiveActivity
//
//  Created by 김재영 on 12/28/25.
//

import SwiftUI
import ActivityKit

@main
struct LiveActivityApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    LiveActivityApp.startLiveActivity()
                }
        }
    }
}

extension LiveActivityApp {
    static func startLiveActivity() {
        guard Activity<LiveActivityExampleAttributes>.activities.isEmpty,
                      ActivityAuthorizationInfo().areActivitiesEnabled else { return }

                let initialContentState = LiveActivityExampleAttributes.ContentState(emoji: "🫶")
                let activityAttributes = LiveActivityExampleAttributes(name: "love")

                do {
                    _ = try Activity.request(
                        attributes: activityAttributes,
                        content: .init(
                            state: initialContentState,
                            staleDate: nil
                        )
                    )
                } catch {
                    print("LiveActivity not available: \(error.localizedDescription)")
                }
    }
}
