//
//  ImagePickerView.swift
//  UIKitInSwiftUI
//
//  Created by 김재영 on 11/4/25.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    
    // SwiftUI 뷰의 @State 변수와 연결될 @Binding
    @Binding var selectedImage: UIImage?
    
    // SwiftUI 뷰에서 .sheet를 닫기 위해 필요
    @Environment(\.presentationMode) var presentationMode

    // 1. 뷰 컨트롤러 생성 (처음 한 번만 호출)
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary // 사진첩 사용
        imagePicker.delegate = context.coordinator // 델리게이트를 Coordinator로 설정
        return imagePicker
    }

    // 2. 뷰 컨트롤러 업데이트 (상태 변경 시 호출)
    //    (이 예제에서는 특별히 업데이트할 내용이 없습니다.)
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    // 3. Coordinator 생성
    //    makeUIViewController보다 먼저 호출됩니다.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // 4. Coordinator 클래스 (NSObject와 델리게이트 프로토콜 상속)
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerView

        init(_ parent: ImagePickerView) {
            self.parent = parent
        }

        // 5. 이미지가 선택되었을 때 호출되는 델리게이트 메서드
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 원본 이미지를 가져옵니다.
            if let image = info[.originalImage] as? UIImage {
                // 부모 뷰(ImagePickerView)의 @Binding 변수를 업데이트합니다.
                parent.selectedImage = image
            }
            // 이미지 피커(sheet)를 닫습니다.
            parent.presentationMode.wrappedValue.dismiss()
        }

        // 6. 이미지 피커가 취소되었을 때
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
