//
//  TestData.swift
//  TestProject
//
//  Created by Eric Olsson on 3/27/23.
//

import Foundation

// This object below represents a post-decoded value, ready to be used in the app

let MarvelModelHC = [
    MarvelModel(
        code: 200,
        status: "Ok",
        copyright: "© 2023 MARVEL",
        attributionText: "Data provided by Marvel. © 2023 MARVEL",
        attributionHTML: "<a href=\"http://marvel.com\">Data provided by Marvel. © 2023 MARVEL</a>",
        etag: "4e45f408ef4357d03e6acdcffc3ff1d1c84941b9",
        data: DataClass(
            offset: 800,
            limit: 2,
            total: 1562,
            count: 2,
            results: [
                Result(
                    id: 1015018,
                    name: "Marcus Van Sciver",
                    description: "",
                    modified: "2010-11-12T14:47:59-0500",
                    thumbnail: Thumbnail(
                        path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                        thumbnailExtension: Extension.jpg
                    ), resourceURI: "http://gateway.marvel.com/v1/public/characters/1015018",
                    comics: Comics(
                        available: 0,
                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/comics",
                        items: [],
                        returned: 0
                    ),
                    series: Comics(
                        available: 0,
                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/series",
                        items: [],
                        returned: 0
                    ),
                    stories: Stories(
                        available: 0,
                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/stories",
                        items: [],
                        returned: 0
                    ),
                    events: Comics(
                        available: 0,
                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/events",
                        items: [],
                        returned: 0
                    ),
                    urls: [
                        URLElement(
                            type: URLType.detail,
                            url: "http://marvel.com/characters/3419/marcus_van_sciver?utm_campaign=apiRef&utm_source=f0c5210c2332d5d32edc3a40552edb27"
                        ),
                        URLElement(
                            type: URLType.comiclink,
                            url: "http://marvel.com/comics/characters/1015018/marcus_van_sciver?utm_campaign=apiRef&utm_source=f0c5210c2332d5d32edc3a40552edb27"
                        )
                    ]
                ),
                Result(
                    id: 1011335,
                    name: "Maria Hill",
                    description: "",
                    modified: "2014-05-30T14:29:18-0400",
                    thumbnail: Thumbnail(
                        path: "http://i.annihil.us/u/prod/marvel/i/mg/a/00/535ff3f5397cb",
                        thumbnailExtension: Extension.jpg
                    ), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011335",
                    comics: Comics(
                        available: 100,
                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/comics",
                        items: [
                            ComicsItem(
                                resourceURI: "http://gateway.marvel.com/v1/public/comics/30090",
                                name: "Age of Heroes (2010) #1")
                        ],
                        returned: 0
                    ),
                    series: Comics(
                        available: 0,
                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/series",
                        items: [],
                        returned: 0
                    ),
                    stories: Stories(
                        available: 0,
                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/stories",
                        items: [],
                        returned: 0
                    ),
                    events: Comics(
                        available: 0,
                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/events",
                        items: [],
                        returned: 0
                    ),
                    urls: [
                        URLElement(
                            type: URLType.detail,
                            url: "http://marvel.com/characters/3419/marcus_van_sciver?utm_campaign=apiRef&utm_source=f0c5210c2332d5d32edc3a40552edb27"
                        ),
                        URLElement(
                            type: URLType.comiclink,
                            url: "http://marvel.com/comics/characters/1015018/marcus_van_sciver?utm_campaign=apiRef&utm_source=f0c5210c2332d5d32edc3a40552edb27"
                        )
                    ]
                )
            ]
        )
    )
]
