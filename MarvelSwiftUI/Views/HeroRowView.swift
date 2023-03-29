//
//  HeroRowView.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/29/23.
//

import SwiftUI

struct HeroesRowView: View {
    var hero: HeroModel
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: hero.photo)) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            } placeholder: {
                Text("Downloading photo...")
            }
            Text("\(hero.name)")
                .font(.title)
                .foregroundColor(.gray)
                .bold()
        }
    }
}

struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(
            hero: HeroModel(
                id: "001",
                name: "Thor",
                photo: "http://i.annihil.us/u/prod/marvel/i/mg/d/d0/5269657a74350.jpg",
                description: "As the Norse God of thunder and lightning, Thor wields one of the greatest weapons ever made, the enchanted hammer Mjolnir. While others have described Thor as an over-muscled, oafish imbecile, he's quite smart and compassionate. He's self-assured, and he would never, ever stop fighting for a worthwhile cause.",
                series: Comics(
                    available: 0,
                    collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/series",
                    items: [
                        ComicsItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/comics/30090",
                            name: "Age of Heroes (2010) #1"
                        )
                    ],
                    returned: 0
                )
            ) // end HeroModel
        )
    }
}
