//
//  GeometryReaderBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 25.03.2025.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack (spacing: 0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width * 0.666)
                
                Rectangle()
                    .fill(Color.blue)
                
            }
            .ignoresSafeArea()
            
            
        }
        
        
        
        
    }
}

#Preview {
    GeometryReaderBootcamp()
}
