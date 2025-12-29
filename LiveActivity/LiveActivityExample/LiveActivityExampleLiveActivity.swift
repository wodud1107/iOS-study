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
        ActivityConfiguration(for: PizzaDeliveryAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "box.truck.badge.clock")
                        .foregroundStyle(.indigo)
                    Text("주문 번호 #\(context.attributes.orderNumber)")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                Text("\(context.state.driverName) 기사님이 배달 중입니다.")
                    .foregroundStyle(.white)
                Text("상태: \(context.state.status) (도착: \(context.state.arrivalTime))")
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding()
            .activityBackgroundTint(Color.black.opacity(0.8))

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Label("\(context.attributes.numberOfItems)개", systemImage: "bag")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.arrivalTime)
                        .font(.title2)
                        .foregroundStyle(.indigo)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text(context.state.status)
                        .font(.caption)
                }
            } compactLeading: {
                Image(systemName: "box.truck.fill")
                    .foregroundStyle(.indigo)
            } compactTrailing: {
                Text(context.state.arrivalTime)
            } minimal: {
                Image(systemName: "timer")
            }
        }
    }
}
