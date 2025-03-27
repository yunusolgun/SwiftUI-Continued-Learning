//
//  CodableBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 27.03.2025.
//

import SwiftUI

struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
//        if let localData = try? JSONSerialization.jsonObject(with: data),
//           let dictionary = localData as? [String: Any],
//           let id = dictionary["id"] as? String,
//           let name = dictionary["name"] as? String,
//           let points = dictionary["points"] as? Int,
//           let isPremium = dictionary["isPremium"] as? Bool
//        {
//
//            self.customer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//        }
        
        

    }
    
    func getJSONData() -> Data? {
        let customer = CustomerModel(id: "123", name: "Test2", points: 1000, isPremium: true)
        let jsonData = try? JSONEncoder().encode(customer)
        
//        let dictionary: [String: Any] = [
//            "id": "123",
//            "name": "Test2",
//            "points": 1000,
//            "isPremium": true
//        ]
//        
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
        
        return jsonData
    }
    
}

struct CodableBootcamp: View {
    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text(customer.points.description)
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}
