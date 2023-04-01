//
//  MarvelSwiftUIApp.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import SwiftUI

@main
struct MarvelSwiftUIApp: App {
    
    @StateObject var heroViewModel = HeroViewModel()
    
    // This is not right. It splits the main screen in half with the two views in the WindowGroup...
//    @StateObject var seriesViewModel = SeriesViewModel()
//    var hero: Result?
    
    var body: some Scene {
    
        WindowGroup {

            HeroView().environmentObject(heroViewModel)
//            SeriesView(hero: hero ?? heroDefault).environmentObject(seriesViewModel) // adding this to see if helps
        }
    }
}
