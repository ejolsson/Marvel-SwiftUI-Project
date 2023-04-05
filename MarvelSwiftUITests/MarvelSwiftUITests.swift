//
//  MarvelSwiftUITests.swift
//  MarvelSwiftUITests
//
//  Created by Eric Olsson on 3/25/23.

import XCTest
import ViewInspector
import SwiftUI
import Combine
@testable import MarvelSwiftUI

final class MarvelSwiftUITests: XCTestCase {

    let SeriewView: SeriesView? = nil
    
    let hero = Result(
        id: 1009368,
        name: "Iron Man",
        description: "Wounded, captured and forced to build a weapon by his enemies...",
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
                )
            ],
            returned: 20)
    )
    
    let series = SeriesResult(
        id: 16450,
        title: "A+X (2012 - 2014)",
        description: "et ready for action-packed stories featuring team-ups from your favorite Marvel heroes every month! First, a story where Wolverine and Hulk come together, and then Captain America and Cable meet up! But will each partner's combined strength be enough?",
        thumbnail: Thumbnail(
            path: "http://i.annihil.us/u/prod/marvel/i/mg/5/d0/511e88a20ae34",
            thumbnailExtension: Extension.jpg
        )
    )

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }

    func testExample() throws {
        XCTAssertEqual(1, 1)
    }
 
    // Model testing
    func testModels() throws {

        XCTAssertNotNil(hero)
        
        XCTAssertEqual(hero.id, 1009368)
        XCTAssertNotEqual(hero.id, 999999)

        XCTAssertEqual(hero.name, "Iron Man")
        XCTAssertNotEqual(hero.name, "Superman")
        
        XCTAssertEqual(hero.description, "Wounded, captured and forced to build a weapon by his enemies...")
        XCTAssertNotEqual(hero.description, "A lazy hero")

        let series = SeriesResult(
                id: 16450,
                title: "A+X (2012 - 2014)",
                description: "et ready for action-packed stories featuring team-ups from your favorite Marvel heroes every month! First, a story where Wolverine and Hulk come together, and then Captain America and Cable meet up! But will each partner's combined strength be enough?",
                thumbnail: Thumbnail(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/5/d0/511e88a20ae34",
                    thumbnailExtension: Extension.jpg
                )
            )
        
        XCTAssertNotNil(series)
        
        XCTAssertEqual(series.id, 16450)
        XCTAssertNotEqual(series.id, 99999)

        XCTAssertEqual(series.title, "A+X (2012 - 2014)")
        XCTAssertNotEqual(series.title, "Avengers")
        
        XCTAssertEqual(series.description, "et ready for action-packed stories featuring team-ups from your favorite Marvel heroes every month! First, a story where Wolverine and Hulk come together, and then Captain America and Cable meet up! But will each partner's combined strength be enough?")
        XCTAssertNotEqual(series.description, "Another sleepy story")

    }

    // UI testing
    func testHeroView() throws {
        
        let view = HeroView().environmentObject(HeroViewModel())
        
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let text = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(text)
        
        let textBanner = try text.text().string()
        XCTAssertEqual(textBanner, "Marvel Heros")
    }
    
    func testSeriesView() throws {
        
        let view = SeriesView(hero: hero).environmentObject(SeriesViewModel())
        
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let textSeries = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(textSeries)
        
        let textHero = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(textHero)
        
        let textBanner = try textSeries.text().string()
        XCTAssertEqual(textBanner, "Series")
    }
    
    func testHeroRowView() throws {
        
        let view = HeroesRowView(hero: hero)
        
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let text = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(text)
        
        let placeholder = try view.inspect().find(viewWithId: 6)
        XCTAssertNotNil(placeholder)
        
        let image = try view.inspect().find(viewWithId: 7)
        XCTAssertNotNil(image)
    }
    
    func testSeriesRowView() throws {
        
        let view = SeriesRowView(series: series)
        
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let text = try view.inspect().find(viewWithId: 8)
        XCTAssertNotNil(text)
        
        let placeholder = try view.inspect().find(viewWithId: 9)
        XCTAssertNotNil(placeholder)
        
        let image = try view.inspect().find(viewWithId: 10)
        XCTAssertNotNil(image)
    }
}
