//
//  SeriesRowView.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/30/23.
//

import SwiftUI

struct SeriesRowView: View { 

    var series: SeriesResult

    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "\(series.thumbnail.path).\(Extension.jpg)")) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
                    .id(8)
            } placeholder: {
                Text("Downloading photo...")
                    .id(9)
            }
            Text("\(series.title)")
                .font(.title)
                .foregroundColor(.gray)
                .bold()
                .id(10)
        }
    }
}

struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView(
            series: SeriesResult(
                id: 16450,
                title: "A+X (2012 - 2014)",
                description: "et ready for action-packed stories featuring team-ups from your favorite Marvel heroes every month! First, a story where Wolverine and Hulk come together, and then Captain America and Cable meet up! But will each partner's combined strength be enough?",
                thumbnail: Thumbnail(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/5/d0/511e88a20ae34",
                    thumbnailExtension: Extension.jpg
                )
            )
        )
    }
}
