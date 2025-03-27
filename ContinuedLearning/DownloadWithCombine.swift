//
//  DownloadWithCombine.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 27.03.2025.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("There was an error \(error)")
                }
            } receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)

    }

    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    
}

struct DownloadWithCombine: View {
    
    @StateObject var vm =  DownloadWithCombineViewModel()
    
    
    var body: some View {
        List {
            ForEach(vm.posts) { posts in
                VStack(alignment: .leading) {
                    Text(posts.title)
                        .font(.headline)
                    Text(posts.body)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
