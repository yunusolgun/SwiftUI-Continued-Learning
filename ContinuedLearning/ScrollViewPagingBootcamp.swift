//
//  ScrollViewPagingBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 29.03.2025.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0..<20) { index in
                    Rectangle()
                        
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)
                        .overlay {
                            Text("\(index)").foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(10)
//                        .containerRelativeFrame(.horizontal, alignment: .center)
                }
            }
        }
        .ignoresSafeArea()
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
        .scrollBounceBehavior(.basedOnSize)
        
        
        
        
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(0..<20) { index in
//                    Rectangle()
//                        
////                        .frame(width: 300, height: 300)
//                        .overlay {
//                            Text("\(index)").foregroundColor(.white)
//                        }
//                        .frame(maxWidth: .infinity)
////                        .padding(.vertical, 10)
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging)
//        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
