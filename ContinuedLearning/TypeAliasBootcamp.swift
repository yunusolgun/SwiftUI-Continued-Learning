//
//  TypeAliasBootcamp.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 27.03.2025.
//

import SwiftUI

struct MovieModel  {
    let title: String
    let director: String
    let count: Int
}


typealias TVModel = MovieModel


struct TypeAliasBootcamp: View {
    
    //@State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV title", director: "Emily", count: 10)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text(item.count.description)
        }
    }
}

#Preview {
    TypeAliasBootcamp()
}
