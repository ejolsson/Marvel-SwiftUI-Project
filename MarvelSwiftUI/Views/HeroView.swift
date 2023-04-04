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
        NavigationStack{
            Text("Marvel Heros")
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
            .onAppear{
                viewModel.getHerosV2() // will save heroes @Published
            }
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView().environmentObject(HeroViewModel())
    }
}
