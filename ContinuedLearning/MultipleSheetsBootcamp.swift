//
//  MultipleSheetsBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 25.03.2025.
//

import SwiftUI

struct RandomModel: Identifiable {
    var id = UUID().uuidString
    var title: String
}

/*
 Solutions:
 1- use a binding
 2- use multiple .sheets
 3- use $item
 */


struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel = RandomModel(title: "Starting title")
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20.0) {
            Button("Button 1") {
                selectedModel = RandomModel(title: "One")
                showSheet.toggle()
            }
            
            Button("Button 2") {
                selectedModel = RandomModel(title: "Two")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet) {
            NextScreen(selectedModel: $selectedModel)
        }
    }
}

struct NextScreen: View {
    @Binding var selectedModel: RandomModel
    var body: some View {
        Text(selectedModel.title).font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
