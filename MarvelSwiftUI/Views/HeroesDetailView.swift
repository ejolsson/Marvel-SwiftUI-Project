//
//  HeroDetailView.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/29/23.
//

import SwiftUI // TODO: --- REMOVE THIS FILE --- REMOVE THIS FILE --- REMOVE THIS FILE --- REMOVE THIS FILE ---

struct HeroesDetailView: View { // was HerosDetail
    
    @EnvironmentObject var viewModel: HeroViewModel
//    @StateObject var viewModel: HeroViewModel
    var hero: Result
//    var heroes: [Result]
    
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
                        
                    let _ = print("hero.series.items.first?.name: \(String(describing: hero.series.items.first?.name))")
                    
                    let series1 = hero.series.items.prefix(5) // series1 is an array
                    
                    let _ = print("hero.series.items.prefix(5): \(hero.series.items.prefix(5))") // array print gtg
                    
//                    List(series1.name, rowContent: series1.count) // Cannot convert value of type 'Int' to expected argument type '(Int) -> RowContent'
                    
                    // Referencing initializer 'init (_:content:)' on 'ForEach' requires that 'ComicsItem conform to 'Identifiable'
//                    List(heroes) { hero in
//                        ForEach(hero.series.items) { item in
//                            Text(item.name)
//                        }
                        
//                    List {
//                        ForEach(series1, id: \.self) {serie in
//                            Text(serie.name)
//                        }
//                    }
                    
                    // Create list of series
//                    List{

//                        let series1 = hero.series.items.prefix(5)

//                        ForEach(series1, id: \.self) { seri in
//                        Label(series1.name)
//                        }

//                        if let series2 = hero.series.items.prefix(5) {
//                            ForEach(series2, id: \.self) { seri in
//                            Label(series2.name)
//                            }
//                        }
//
//
//                        if let series3 = hero.series.items.prefix(5) {
//                            for item in series3 {
//                                Text(item.series.name)
//                            }
//                        }
                        
                        
                        
//                        if let series = hero.description{
//                        if let series = hero.series.items.name{
//                            print("\(series)\n")
//                            ForEach(series) { series in
//                            Text (series)
//                            } //end ForEach
//                        } // let series
                    
//                    } // end List
                    
                    
                } // Vstack
            } // end VStack
            
        } // end ScrollView
        
//        .background (Color.blue)
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

