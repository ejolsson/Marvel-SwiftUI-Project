//
//  MarvelModel.swift
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
//    let code: Int
//    let status, copyright, attributionText, attributionHTML: String
//    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
//    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id: Int
    let name, description: String
//    let modified: String // was Date
    let thumbnail: Thumbnail
//    let resourceURI: String
//    let comics: Comics
    let series: Comics
//    let stories: Stories
//    let events: Comics
//    let urls: [URLElement]
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable { //}, Hashable { //}, Identifiable {
//    let id: Int
    let resourceURI: String
    let name: String
}

// MARK: - Stories
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}

// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: ItemType
//}

//enum ItemType: String, Codable {
//    case cover = "cover"
//    case empty = ""
//    case interiorStory = "interiorStory"
//    case profile = "profile"
//    case recap = "recap"
//}

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
//struct URLElement: Codable {
//    let type: URLType
//    let url: String
//}

//enum URLType: String, Codable {
//    case comiclink = "comiclink"
//    case detail = "detail"
//    case wiki = "wiki"
//}

let heroDefault = Result(
    id: 1009368,
    name: "Iron Man",
    description: "Wounded, captured and forced to build a weapon by his enemies, billionaire industrialist Tony Stark instead created an advanced suit of armor to save his life and escape captivity. Now with a new outlook on life, Tony uses his money and intelligence to make the world a safer, better place as Iron Man.",
    thumbnail: Thumbnail(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55",
        thumbnailExtension: Extension.jpg
    ),
    series: Comics(
        available: 659,
        collectionURI: "http://gateway.marvel.com/v1/public/characters/1009368/series",
        items: [
            ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/series/16450",
                name: "A+X (2012 - 2014)"
            ),
            ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/series/6079",
                name: "Adam: Legend of the Blue Marvel (2008)"
            ),
            ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/series/27392",
                name: "Aero (2019 - 2020)"
            ),
            ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/series/9790",
                name: "Age of Heroes (2010)"
            )
        ],
        returned: 20)
)

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
