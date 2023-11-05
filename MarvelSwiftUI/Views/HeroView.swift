//
//  HeroView.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/28/23.
//

import SwiftUI

struct HeroView: View {
    
    @EnvironmentObject var viewModel: HeroViewModel
    @State private var filter = ""
    
    var body: some View {
        let heroes = viewModel.heroes
        #if os(iOS) // TODO: add watchOS
            NavigationStack{
                Text("Marvel Heroes")
                    .bold()
                    .font(.title)
                    .id(0) // added for testing and item id
                Spacer()
                List{
                    ForEach(heroes) { hero in
                        NavigationLink {
                            SeriesView(hero: hero).environmentObject(SeriesViewModel())
                                .id(1)
                        } label: {
                            HeroesRowView(hero: hero)
                                .id(2)
                        }
                    }
                }
            }
        // TODO: add .navigationBarTitle("Heroes")
        #else
            NavigationStack{
                Text("Marvel Heroes")
                    .bold()
                    .font(.title)
                    .id(0) // added for testing and item id
                Spacer()
                List{
                    ForEach(heroes) { hero in
                        NavigationLink {
                            SeriesView(hero: hero).environmentObject(SeriesViewModel())
                                .id(1)
                        } label: {
                            HeroesRowView(hero: hero)
                                .id(2)
                        }
                    }
                }
            }
        #endif
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView().environmentObject(HeroViewModel())
    }
}
