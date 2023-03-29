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
            List{
                if let heros = viewModel.heroes{
                    ForEach(heros) { hero in
                        NavigationLink {
                            HeroesDetailView(hero: hero)
                        } label: {
                            HeroesRowView(hero: hero)
                        }
                    } //end ForEach
                } // end if let heros
            } // end List
        } // end NavStack
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView().environmentObject(HeroViewModel())
    }
}
