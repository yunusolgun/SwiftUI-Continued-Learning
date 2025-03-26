//
//  HapticsBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 25.03.2025.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    private init() {}
    
    func impact() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
    

}

struct HapticsBootcamp: View {
    var body: some View {
        VStack {
            Button("impact me") {
                HapticManager.instance.impact()
            }
        }
    }
}

#Preview {
    HapticsBootcamp()
}
