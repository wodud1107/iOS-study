//
//  PizzaDeliveryAttributes.swift
//  LiveActivity
//
//  Created by 김재영 on 12/29/25.
//

import ActivityKit
import Foundation

struct PizzaDeliveryAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var status: String
        var arrivalTime: String
        var driverName: String
    }

    var orderNumber: String
    var numberOfItems: Int
}
