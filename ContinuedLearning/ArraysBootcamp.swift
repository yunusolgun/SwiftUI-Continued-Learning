//
//  ArraysBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 26.03.2025.
//

import SwiftUI

struct UserModel: Identifiable {
    var id = UUID().uuidString
    var name: String?
    let point: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init () {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        //sort
        //filter
        //map
        
//        filteredArray = dataArray.sorted { $0.point > $1.point }
        
//        filteredArray = dataArray.filter { $0.isVerified }
//        filteredArray = dataArray.filter { $0.point > 500 }
//        filteredArray = dataArray.filter { $0.isVerified && $0.point > 500 }
//        filteredArray = dataArray.filter { $0.isVerified }.sorted { $0.point > $1.point }

//        mappedArray = dataArray.map { "\($0.name) - \($0.point)" }
//        mappedArray = dataArray.compactMap { $0.isVerified ? "\($0.name)" : nil }
//        mappedArray = dataArray.compactMap { $0.name }
        
        let sort = dataArray.sorted { $0.point > $1.point }
        let filter = sort.filter { $0.isVerified }
        let map = filter.map { "\($0.name ?? "") - \($0.point)" }
        
        mappedArray = map
        
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Ali", point: 100, isVerified: true)
        let user2 = UserModel(name: "Veli", point: 200, isVerified: false)
        let user3 = UserModel(name: nil, point: 300, isVerified: true)
        let user4 = UserModel(name: "Can", point: 400, isVerified: false)
        let user5 = UserModel(name: "Ozlem", point: 500, isVerified: true)
        let user6 = UserModel(name: "Emre", point: 600, isVerified: false)
        let user7 = UserModel(name: "Nilüfer", point: 700, isVerified: true)
        let user8 = UserModel(name: nil, point: 800, isVerified: false)
        let user9 = UserModel(name: "Nazer", point: 900, isVerified: true)
        let user10 = UserModel(name: "Lüfer", point: 1000, isVerified: false)
        self.dataArray.append(contentsOf: [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10])
        
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.point)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
