//
//  SeriesModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/30/23.
//

import Foundation


struct SeriesModel: Codable {
    let code: Int
    let data: DataClassSeries
}

struct DataClassSeries: Codable {
//    let offset, limit, total, count: Int
    let results: [SeriesResult]
}

struct SeriesResult: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
}
