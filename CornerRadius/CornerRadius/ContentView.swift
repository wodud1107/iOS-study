//
//  ContentView.swift
//  CornerRadius
//
//  Created by 김재영 on 11/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .background(Color.orange, in: RoundedRectangle(cornerRadius: 10))
            Text("ClipShape")
                .background(Color.purple)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text("Custom Shape")
                .background(Color.green)
                .cornerRadius(10, corners: .topRight)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
