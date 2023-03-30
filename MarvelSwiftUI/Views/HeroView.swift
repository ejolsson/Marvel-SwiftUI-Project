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

        // below switch statement reason for runtime fail... and api not working...
//        switch viewModel.status{
//        case .none:
//            HeroView()
////        case .register:
////            Text("Registro")
//        case .loaded:
////            PrincipalView()
//            HeroView()
//        case .error(error: let errorSring):
////            ErrorView(error: errorSring)
//            HeroView()
//        case .loading:
//            HeroView()
//            // TODO: add loader view
////            LoaderView() //loader
//        }
//        print("heros: \(viewModel.heroes)\n")
        
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
