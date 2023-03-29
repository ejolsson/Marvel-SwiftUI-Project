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
    
    var body: some Scene {
    
        WindowGroup {

            HeroView().environmentObject(heroViewModel)
        }
    }
}
