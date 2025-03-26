//
//  DragGestureBootcamp2.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 25.03.2025.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingDragOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingDragOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation {
                                if currentDragOffsetY < -150 {
                                    endingDragOffsetY = -startingOffsetY
                                   
                                } else if endingDragOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingDragOffsetY = 0
                                    
                                }
                                currentDragOffsetY = 0
                                
                            }
                        }
                )
            
            
            Text("\(currentDragOffsetY)")
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureBootcamp2()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign Up")
                .font(.headline)
                .fontWeight(.semibold)
            
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit( )
                .frame(width: 100, height: 100)
            
            Text("This is the description for our app. This is my favarite SwiftUI course and I recommend to all of my friends. This is the best course ever.")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.9).cornerRadius(20))
    }
}
