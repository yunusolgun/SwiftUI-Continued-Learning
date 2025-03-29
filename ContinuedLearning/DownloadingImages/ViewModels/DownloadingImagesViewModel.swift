//
//  DownloadingImagesViewModel.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 29.03.2025.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    let dataService = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels.sink { [weak self] (returnedPhotoModels) in
            self?.dataArray = returnedPhotoModels
        }
        .store(in: &cancellables)
    }
    
}
