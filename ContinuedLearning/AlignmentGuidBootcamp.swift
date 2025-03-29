//
//  AlignmentGuidBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 29.03.2025.
//

import SwiftUI

struct AlignmentGuidBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World!")
                .background(Color.blue)
                .alignmentGuide(.leading) { dimensions in
                    return dimensions.width * 0.5
                }
            
            Text("This is some other text")
                .background(Color.red)
        }
        .background(Color.orange)
    }
}

#Preview {
    AlignmentGuidBootcamp()
}
