//
//  HeroDetailView.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/29/23.
//

import SwiftUI

struct HeroesDetailView: View {
    
    @EnvironmentObject var viewModel: HeroViewModel
//    @StateObject var viewModel: HeroViewModel
    var hero: Result
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                
                HStack{
                    Text(hero.name)
                        .bold()
                        .font(.title)
                    Spacer()
                }
                .padding([.leading, .trailing], 20)
                
                //Foto
                AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(Extension.jpg)")) { Image in
                    Image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing],5)
                        .opacity(0.6)
                    
                } placeholder: {
                    Text("Downloading...")
                }
                
                // TODO: - VStack Series listings instead of description -
//                Text(hero.description)
//                    .foregroundColor(.gray)
//                    .font(.caption)
//                    .padding([.leading, .trailing, .top],10)
                
                VStack {
                    Text("Series")
                        .bold()
                    Spacer()
                    Text(hero.series.items.first?.name ?? "")
                    Text("Line 1")
                    Text("Line 2")
                    Text("Line 3")
                    Text("Line 4")
                    Text("Line 5")
                    
                    // Create list of series
                    List{

//                        if let series = hero.description{
//                        if let series = hero.series.items.name{
//                            print("\(series)\n")
//                            ForEach(series) { series in
//                            Text (series)
//                            } //end ForEach
//                        } // let series
                    } // end List
                } // series 
            } // end VStack
            
        } // end ScrollView
        .background (Color.blue)
    }
}


struct HeroesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView().environmentObject(HeroViewModel())
        HeroesDetailView(
            hero: Result(
                id: 1009368,
                name: "Iron Man",
                description: "Wounded, captured and forced to build a weapon by his enemies, billionaire industrialist Tony Stark instead created an advanced suit of armor to save his life and escape captivity. Now with a new outlook on life, Tony uses his money and intelligence to make the world a safer, better place as Iron Man.",
                thumbnail: Thumbnail(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55",
                    thumbnailExtension: Extension.jpg
                ),
                series: Comics(
                    available: 659,
                    collectionURI: "http://gateway.marvel.com/v1/public/characters/1009368/series",
                    items: [
                        ComicsItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/series/16450",
                            name: "A+X (2012 - 2014)"
                        ),
                        ComicsItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/series/6079",
                            name: "Adam: Legend of the Blue Marvel (2008)"
                        ),
                        ComicsItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/series/27392",
                            name: "Aero (2019 - 2020)"
                        ),
                        ComicsItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/series/9790",
                            name: "Age of Heroes (2010)"
                        )
                    ],
                    returned: 20)
            ) // end Result
        ) // end HeroesDetailView
    } // end static var
}

