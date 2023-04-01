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

        NavigationStack{
            Text("Marvel Heros")
                .bold()
                .font(.title)
            Spacer()
            List{
                if let heroes = viewModel.heroes{
                    ForEach(heroes) { hero in
                        NavigationLink {
//                            HeroesDetailView(hero: hero)
                            SeriesView(hero: hero).environmentObject(SeriesViewModel())
                        } label: {
                            HeroesRowView(hero: hero)
                        }
                    } //end ForEach
                } // end if let heros
            } // end List
        } // end NavStack
    } // end var body
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView().environmentObject(HeroViewModel())
    }
}
