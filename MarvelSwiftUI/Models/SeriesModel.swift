//
//  SeriesModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/30/23.
//

import Foundation

// MARK: - Series
struct SeriesModel: Codable {
    let code: Int
//    let status, copyright, attributionText, attributionHTML: String
//    let etag: String
    let data: DataClassSeries
}

// MARK: - DataClass
struct DataClassSeries: Codable {
//    let offset, limit, total, count: Int
    let results: [SeriesResult]
}

// MARK: - Result
struct SeriesResult: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
//    let resourceURI: String
//    let urls: [URLElement]
//    let startYear, endYear: Int
//    let rating: String
//    let type: ResultType
//    let modified: ModifiedUnion
    let thumbnail: Thumbnail
//    let creators: Creators
//    let characters: Characters
//    let stories: Stories
//    let comics, events: Characters
//    let next, previous: Next?
}

//// MARK: - Characters
//struct Characters: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [Next]
//    let returned: Int
//}
//
//// MARK: - Next
//struct Next: Codable {
//    let resourceURI: String
//    let name: String
//}
//
//// MARK: - Creators
//struct Creators: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [CreatorsItem]
//    let returned: Int
//}
//
//// MARK: - CreatorsItem
//struct CreatorsItem: Codable {
//    let resourceURI: String
//    let name: String
//    let role: Role
//}
//
//enum Role: String, Codable {
//    case artist = "artist"
//    case colorist = "colorist"
//    case coloristCover = "colorist (cover)"
//    case editor = "editor"
//    case inker = "inker"
//    case inkerCover = "inker (cover)"
//    case letterer = "letterer"
//    case other = "other"
//    case painter = "painter"
//    case painterCover = "painter (cover)"
//    case penciler = "penciler"
//    case pencilerCover = "penciler (cover)"
//    case penciller = "penciller"
//    case pencillerCover = "penciller (cover)"
//    case roleArtist = "Artist"
//    case roleColorist = "Colorist"
//    case roleInker = "Inker"
//    case roleLetterer = "Letterer"
//    case rolePenciller = "Penciller"
//    case roleWriter = "Writer"
//    case writer = "writer"
//}
//
//enum ModifiedUnion: Codable {
//    case dateTime(Date)
//    case enumeration(ModifiedEnum)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Date.self) {
//            self = .dateTime(x)
//            return
//        }
//        if let x = try? container.decode(ModifiedEnum.self) {
//            self = .enumeration(x)
//            return
//        }
//        throw DecodingError.typeMismatch(ModifiedUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ModifiedUnion"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .dateTime(let x):
//            try container.encode(x)
//        case .enumeration(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//enum ModifiedEnum: String, Codable {
//    case the00011130T0000000500 = "-0001-11-30T00:00:00-0500"
//}
//
//// MARK: - Stories
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}
//
//// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: ItemType
//}
//
//enum ItemType: String, Codable {
//    case cover = "cover"
//    case empty = ""
//    case feature = "feature"
//    case features = "features"
//    case interiorStory = "interiorStory"
//    case letters = "letters"
//    case pinup = "pinup"
//    case preview = "preview"
//    case recap = "recap"
//    case textPage = "text page"
//}

//// MARK: - Thumbnail - REUSE FROM MarvelModel
//struct Thumbnail: Codable {
//    let path: String
//    let thumbnailExtension: Extension
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//    }
//}
//
//enum Extension: String, Codable { - REUSE FROM MarvelModel
//    case jpg = "jpg"
//}

//enum ResultType: String, Codable {
//    case collection = "collection"
//    case empty = ""
//    case limited = "limited"
//    case oneShot = "one shot"
//    case ongoing = "ongoing"
//}
//
//// MARK: - URLElement
//struct URLElement: Codable {
//    let type: URLType
//    let url: String
//}
//
//enum URLType: String, Codable {
//    case detail = "detail"
//}

