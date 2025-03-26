//
//  ScrollViewReaderBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 25.03.2025.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var scrollToIndex: Int = 0
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            
            TextField("Enter a number here...", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll Now") {
                withAnimation() {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                    //proxy.scrollTo(29, anchor: .center)
                }
                
            }
            
            ScrollView (showsIndicators: false){
                ScrollViewReader { proxy in
                
                    
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(10)
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
