//
//  RotationGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 24.03.2025.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .padding(50)
            .background(Color.blue)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .cornerRadius(10)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded({ value in
                        withAnimation {
                            angle = .degrees(0)
                        }
                    })
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
