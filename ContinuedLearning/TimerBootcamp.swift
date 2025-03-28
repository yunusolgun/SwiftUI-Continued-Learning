//
//  TimerBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 28.03.2025.
//

import SwiftUI

struct TimerBootcamp: View {
    
    //let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    //Current Time
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }
    
    //Countdown
    @State var count: Int = 10
    @State var finishedText: String? = nil
    
    //Countdown to date
    @State var timeRemaining: String? = nil
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = String(format: "%02d:%02d:%02d", hour, minute, second)
        
    }
    
    //Animation counter
    @State var countAnimation: Int = 0
    
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.blue, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            HStack(spacing: 15) {
                Circle()
                    .offset(y: countAnimation == 1 ? -20 : 0)
                Circle()
                    .offset(y: countAnimation == 2 ? -20 : 0)
                Circle()
                    .offset(y: countAnimation == 3 ? -20 : 0)
            }
            .foregroundColor(.white)
            .frame(width: 200)
            
//            Text(timeRemaining ?? "")
////            Text(finishedText ?? "\(count)")
////            Text(dateFormatter.string(from: currentDate))
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundColor(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
        }
        .onReceive(timer) { value in
            //currentDate = value
            
//            if count <= 1 {
//                finishedText = "Wow!"
//            } else {
//                count -= 1
//            }
            
//            updateTimeRemaining()
            
//            if countAnimation == 3 {
//                countAnimation = 0
//            } else {
//                countAnimation += 1
//            }
            withAnimation(.easeIn(duration: 1)) {
                countAnimation = countAnimation == 3 ? 0 : countAnimation + 1
            }
            
            
        }
    }
}

#Preview {
    TimerBootcamp()
}
