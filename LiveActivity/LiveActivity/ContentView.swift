//
//  ContentView.swift
//  LiveActivity
//
//  Created by 김재영 on 12/28/25.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var currentActivity: Activity<PizzaDeliveryAttributes>? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Button("🍕 배달 시작") {
                startDelivery()
            }
            
            Button("🍳 조리 완료") {
                updateDeliveryStatus(status: "배달 중", time: "10분 후")
            }
            
            Button("✅ 배달 완료") {
                endDelivery()
            }
        }
        .padding()
    }
    
    // 1. 액티비티 시작
    private func startDelivery() {
        let attributes = PizzaDeliveryAttributes(orderNumber: "123", numberOfItems: 2)
        let initialState = PizzaDeliveryAttributes.ContentState(status: "조리 중", arrivalTime: "15분 후", driverName: "배달라이더")
        
        do {
            let newActivity = try Activity.request(attributes: attributes, content: .init(state: initialState, staleDate: nil))
            self.currentActivity = newActivity
            print("Activity Started: \(currentActivity?.id ?? "")")
            
            Task {
                for await tokenData in newActivity.pushTokenUpdates {
                    let token = tokenData.map { String(format: "%02x", $0) }.joined()
                    print("🔥 Push Token for Update: \(token)")
                    // 서버 전송 로직
                    // sendTokenToServer(token, activityId: newActivity.id)
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    // 2. 액티비티 업데이트
    private func updateDeliveryStatus(status: String, time: String) {
        Task {
            let updatedState = PizzaDeliveryAttributes.ContentState(status: status, arrivalTime: time, driverName: "배달라이더")
            await currentActivity?.update(.init(state: updatedState, staleDate: nil))
        }
    }
    
    // 3. 액티비티 종료
    private func endDelivery() {
        Task {
            let finalState = PizzaDeliveryAttributes.ContentState(status: "배달 완료", arrivalTime: "도착", driverName: "배달라이더")
            await currentActivity?.end(.init(state: finalState, staleDate: nil))
        }
    }
}

#Preview {
    ContentView()
}
