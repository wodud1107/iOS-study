//
//  WrongObservedObjectView.swift
//  MySwiftUI
//
//  Created by 김재영 on 10/15/25.
//

import SwiftUI
import Combine

struct WrongObservedObjectView: View {
    @ObservedObject private var viewModel = CounterViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(viewModel.count)")
                .font(.largeTitle)
            Button("Increment") {
                viewModel.increment()
            }
            Text("이 뷰에서는 ViewModel은 뷰가 다시 그려지면 다시 생성됩니다.")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
