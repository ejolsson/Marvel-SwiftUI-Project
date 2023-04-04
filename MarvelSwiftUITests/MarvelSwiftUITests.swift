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

//    var hero: Result?
//    var seriesView = SeriesView()
    let SeriewView: SeriesView? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }
    
//    override func setUp() {
//        super.setUp()
//
//    }
            
//    override func tearDown()  {
//        hero = nil
//        super.tearDown()
//    }
    
//    func testHeroId() {
//        XCTAssertNotNil(hero.id)
//        XCTAssertEqual(hero.id, 1009368)
//        XCTAssertNotEqual(hero.id, 100000)
//        XCTAssertNotEqual(hero.id, 99999)
//    }

    func testExample() throws {
        XCTAssertEqual(1, 1)
    }
 
    func testModels() throws {
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

}
