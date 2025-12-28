//
//  ContentView.swift
//  UIKitInSwiftUI
//
//  Created by 김재영 on 11/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var editorText: String = "여기에 텍스트를 입력하세요."
    @State private var image: UIImage?
    @State private var isShowingImagePicker = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("SwiftUI 텍스트 뷰")
                    .font(.headline)

                TextView(text: $editorText)
                    .frame(height: 200)
                    .border(Color.gray, width: 1)
                    .padding(.horizontal)
                
                Text("--- 실시간 바인딩 확인 ---")
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(editorText)
                    .font(.body)
                    .foregroundColor(.blue)
                
                Spacer()
                
                if let selectedImage = image {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(10)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 300)
                        .cornerRadius(10)
                        .overlay(
                            Text("사진을 선택하세요.")
                                .foregroundColor(.gray)
                        )
                }
                
                Button("사진첩 열기") {
                    self.isShowingImagePicker = true
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePickerView(selectedImage: $image)
            }
        }
    }
}
