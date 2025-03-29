//
//  AccesibilityVoiceOverBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 29.03.2025.
//

import SwiftUI

struct AccesibilityVoiceOverBootcamp: View {
    
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            Form {

                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "On" : "Off")
                            .accessibilityHidden(true)
                    }
                    .background(Color.gray.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityValue(Text(isActive ? "is On" : "is Off"))
                    .accessibilityHint(Text("Double tap to toggle setting."))
                    .accessibilityAction {
                        isActive.toggle()
                    }
                    
                } header: {
                    Text("PREFERENCES")
                }
                
                
                Section {
                    Button("Favorites") {
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel(Text("Favorites"))
                    
                    Text("Favorites")
                        .onTapGesture {
                            
                        }

                    
                } header: {
                    Text("Application")
                }
                
                
                
                VStack {
                    Text("CONTENT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .accessibilityAddTraits(.isHeader)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { index in
                                VStack {
                                    Image("steve")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    Text("Item \(index)")
                                }
                                .onTapGesture {
                                    
                                }
                                
                                
                            }
                            
                        }
                    }
                }
                

            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    AccesibilityVoiceOverBootcamp()
}
