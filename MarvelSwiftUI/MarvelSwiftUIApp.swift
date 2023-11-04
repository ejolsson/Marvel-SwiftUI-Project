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
    @StateObject var seriesViewModel = SeriesViewModel()
    
    var body: some Scene {
    
        WindowGroup {

            MainView()
                .environmentObject(heroViewModel)
//                .environmentObject(seriesViewModel)
        }
    }
}
