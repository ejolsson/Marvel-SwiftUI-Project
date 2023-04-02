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
            Spacer()
            List{
                    ForEach(heroes) { hero in
                        NavigationLink {
                            SeriesView(hero: hero).environmentObject(SeriesViewModel())
                        } label: {
                            HeroesRowView(hero: hero)
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
