//
//  PhotoModel.swift
//  ContinuedLearning
//
//  Created by yunus olgun on 29.03.2025.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
