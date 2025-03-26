//
//  SoundsBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 25.03.2025.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(named: String) {
        guard let url = Bundle.main.url(forResource: named, withExtension: "wav") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    
    
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.instance.playSound(named: "aaa")
            }
            Button("Play sound 2") {
                SoundManager.instance.playSound(named: "bbb")
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
