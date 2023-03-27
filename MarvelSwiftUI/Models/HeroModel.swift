//
//  HeroModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation

// MARK: - HeroModel
struct HerosFilter: Codable {
    var name: String
} // for server calls

// MARK: - MarvelModel
struct MarvelModel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name, description: String
    let modified: String // was Date
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
    case profile = "profile"
    case recap = "recap"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case jpg = "jpg"
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}



//// MARK: - MarvelModel
//struct MarvelModel: Codable {
//    let code: Int
//    let status, copyright, attributionText, attributionHTML: String
//    let etag: String
//    // MARK: - DataClass
//    struct DataClass: Codable {
//        let offset, limit, total, count: Int
//        // MARK: - Result // the main level
//        struct Result: Codable {
//            let id: Int
//            let name, description: String
//            let modified: Date
//            // MARK: - Thumbnail
//            struct Thumbnail: Codable {
//                let path: String
//                let thumbnailExtension: String
//
//                enum CodingKeys: String, CodingKey {
//                    case path
//                    case thumbnailExtension = "extension"
//                }
//            }
//            let resourceURI: String
//            // MARK: - Comics
//            struct Comics: Codable {
//                let available: Int
//                let collectionURI: String
//                // MARK: - ComicsItem
//                struct ComicsItem: Codable {
//                    let resourceURI: String
//                    let name: String
//                }
//                let returned: Int
//            }
//            let series: Comics
//            // MARK: - Stories
//            struct Stories: Codable {
//                let available: Int
//                let collectionURI: String
//                // MARK: - StoriesItem
//                struct StoriesItem: Codable {
//                    let resourceURI: String
//                    let name, type: String
//                }
//                let returned: Int
//            }
//            let events: Comics
//            // MARK: - URLElement
//            struct URLElement: Codable {
//                let type: String
//                let url: String
//            }
//        }
//    }
//}
