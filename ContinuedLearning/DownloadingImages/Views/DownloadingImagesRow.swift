//
//  DownloadingImagesRow.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 29.03.2025.
//

import SwiftUI

struct DownloadingImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            DownloadingImageView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
                
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundStyle(.secondary)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DownloadingImagesRow(model: PhotoModel(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
        .padding()
}
