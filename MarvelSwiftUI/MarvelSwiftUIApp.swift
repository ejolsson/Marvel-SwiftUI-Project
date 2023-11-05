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
            #if os(OSX)
                MainView()
                    .environmentObject(heroViewModel)
                    .frame(minWidth: 400, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
            #else
                MainView()
                    .environmentObject(heroViewModel)
    //                .environmentObject(seriesViewModel)
            #endif
        }
    }
}
