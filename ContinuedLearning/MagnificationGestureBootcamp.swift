//
//  MagnificationGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 24.03.2025.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount : CGFloat = 0
    @State var lastAmount : CGFloat = 0
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(Color.red)
            .cornerRadius(10)
            .scaleEffect(1+currentAmount+lastAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded({ value in
                        lastAmount +=  currentAmount
                        currentAmount = 0
                        
                    })
            )
    }
}

#Preview {
    MagnificationGestureBootcamp()
}
