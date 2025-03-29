//
//  AccessibilityColorsBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 29.03.2025.
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var accessibilityInvertColors
    
    var body: some View {
        VStack {
            Button("Button 1") {
                
            }
            .foregroundColor(colorSchemeContrast == .increased ? .black : .primary)
            .buttonStyle(.borderedProminent)
            
            
            Button("Button 2") {
                
            }
            .foregroundColor(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
            
            Button("Button 3") {
                
            }
            .foregroundColor(.white)
            .foregroundColor(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.green)

            Button("Button 4") {
                
            }
            .foregroundColor(.green)
            .foregroundColor(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            
        }
        .font(.largeTitle)
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}
