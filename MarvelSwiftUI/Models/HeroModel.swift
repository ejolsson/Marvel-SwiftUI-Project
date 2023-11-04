//
//  HeroModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation

struct HeroModel: Codable {
//    let code: Int
    let data: DataClass
}

struct DataClass: Codable {
    let results: [Result]
}

struct Result: Codable, Identifiable {
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail
    let series: Comics
}

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

struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

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
