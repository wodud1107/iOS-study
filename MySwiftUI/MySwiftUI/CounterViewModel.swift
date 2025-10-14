//
//  CounterViewModel.swift
//  MySwiftUI
//
//  Created by 김재영 on 10/14/25.
//

import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    @Published var count = 0

    init() {
        print("CounterViewModel Initialized!")
    }

    func increment() {
        count += 1
    }
}
