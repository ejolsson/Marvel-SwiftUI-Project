//
//  SeriesRowViewModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/30/23.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject {
    
    @Published var series: [SeriesResult]?
//    var series: [SeriesResult]? // option w/o @Published
    @Published var status = Status.none
    @Published var hero: Result? // option w/o @Published
//    var hero: Result // option w/o @Published
    
    var suscriptors = Set<AnyCancellable>()
    
    init() {
//        getSeriesTesting()
        getSeries(hero: hero ?? heroDefault) // pub chg fm bckgnd error..
        // MarvelModel.swift > heroDefault (=Ironman)
    }
    
    func getSeries(hero: Result) {
        
        ApiService.shared.fetchSeries(heroId: hero.id) { [weak self] seriesResponse, error in
            guard let self = self else { return }
            
            if let seriesResponse = seriesResponse {
                self.series = seriesResponse.data.results
                print("SeriesViewModel > getSeries > ApiService.shared.fetchSeries > seriesResponse: \(String(describing: seriesResponse))\n")
            } else {
                print("Error fetching series: ", error?.localizedDescription ?? "") // exec arrives at this line
            }
        }
    }
    
    func getSeriesTesting() {
        
        let series1 = SeriesResult(id: 16450, title: "A+X (2012 - 2014)", description: "et ready for action-packed stories featuring team-ups from your favorite Marvel heroes every month! First, a story where Wolverine and Hulk come together, and then Captain America and Cable meet up! But will each partner's combined strength be enough?", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/d0/511e88a20ae34", thumbnailExtension: Extension.jpg))
        
        let series2 = SeriesResult(id: 6079, title: "Adam: Legend of the Blue Marvel (2008)", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5449710ac36d2", thumbnailExtension: Extension.jpg))
        
        let series3 = SeriesResult(id: 27392, title: "Aero (2019 - 2020)", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/00/5d128077da440", thumbnailExtension: Extension.jpg))
        
        self.series = [series1, series2, series3] // func output 'series'
    }
}