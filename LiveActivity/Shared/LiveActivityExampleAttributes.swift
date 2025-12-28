//
//  LiveActivityExampleAttributes.swift
//  LiveActivity
//
//  Created by 김재영 on 12/29/25.
//

import ActivityKit

struct LiveActivityExampleAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}
