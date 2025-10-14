//
//  CorrectStateObjectView.swift
//  MySwiftUI
//
//  Created by 김재영 on 10/14/25.
//

import SwiftUI
import Combine

struct CorrectStateObjectView: View {
    @StateObject private var viewModel = CounterViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(viewModel.count)")
                .font(.largeTitle)
            Button("Increment") {
                viewModel.increment()
            }
            Text("이 뷰에서는 ViewModel은 뷰가 다시 그려져도 유지됩니다.")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

