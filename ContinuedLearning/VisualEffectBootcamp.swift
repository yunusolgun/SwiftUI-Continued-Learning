//
//  VisualEffectBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 29.03.2025.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    var body: some View {
        
        Text("Hello, World! sdf sdf a sd ssdfdf")
            .padding()
            .background(Color.red)
            .visualEffect { content, geometry in
                content
                    .grayscale(geometry.size.width >= 200 ? 1 : 0)
            }
 

    }
}

#Preview {
    VisualEffectBootcamp()
}
