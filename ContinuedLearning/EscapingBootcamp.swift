//
//  EscapingBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 27.03.2025.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
//        downloadData2 {[weak self] returnedData in
//            self?.text = returnedData
//        }
        
        downloadData4 { [weak self] returnedData in
            self?.text = returnedData.data
        }
        
    }
    
    func downloadData() -> String {
        return "New data"
    }
    
    func downloadData2(completionHandler:  @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            completionHandler("New Data!")
        })
    }
   
    func downloadData4(completionHandler:  @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let result = DownloadResult(data: "new data")
            completionHandler(result)
        })
    }
    
}

struct DownloadResult {
    let data: String
}

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}
