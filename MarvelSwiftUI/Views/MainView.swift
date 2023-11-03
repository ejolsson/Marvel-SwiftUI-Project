//
//  MainView.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 11/3/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: HeroViewModel
    var body: some View {
        
        switch viewModel.status {
        case Status.none:
            Text("No state")
        case Status.loading:
            LoadingView()
        case Status.loaded:
            HeroView()
        case Status.error(error: let errorString):
            Text("Error: \(errorString)")
        }
    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .environmentObject(HeroViewModel())
    }
}
