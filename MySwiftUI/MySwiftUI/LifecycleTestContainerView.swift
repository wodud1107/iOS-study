//
//  LifecycleTestContainerView.swift
//  MySwiftUI
//
//  Created by 김재영 on 10/15/25.
//

import SwiftUI

struct LifecycleTestContainerView: View {
    @State private var showWrongView = false
    @State private var showCorrectView = false

    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Toggle(isOn: $showWrongView.animation()) {
                    Text("@ObservedObject View 표시")
                }
                if showWrongView {
                    WrongObservedObjectView()
                }
            }
            
            Divider()

            VStack {
                Toggle(isOn: $showCorrectView.animation()) {
                    Text("@StateObject View 표시")
                }
                if showCorrectView {
                    CorrectStateObjectView()
                }
            }
        }
        .padding()
    }
}
