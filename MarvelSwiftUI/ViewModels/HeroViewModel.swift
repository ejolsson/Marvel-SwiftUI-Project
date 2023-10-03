//
//  HeroViewModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation
import Combine
import SwiftUI

final class HeroViewModel: ObservableObject {
    
    @Published var heroes = [Result]()
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init() {
//        getHerosTesting()
//        getHeroes()
//        getHerosV2()
    }
    
    func getHeroesV1() {
        
        ApiService.shared.fetchHeros { [weak self] marvelHeroResponse, error in
            guard let self = self else { return }
            
            if let heroes = marvelHeroResponse {
                self.heroes = heroes.data.results // drilling down to right api level
                print("HeroViewModel > getHeroes > ApiService.shared.fetchHeros > marvelResponse: \(String(describing: heroes))\n")
            } else {
                print("Error fetching heros: ", error?.localizedDescription ?? "")
            }
        }
    }
    
    func getHerosV2(){ // async method
        
        URLSession.shared
            .dataTaskPublisher(for: ApiService.shared.heroRequest()) // returns URLRequest
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: HeroModel.self, decoder: JSONDecoder()) // try HeroModel instead of [Result]
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error finding heroes")
                    print("heroes sink failure\n")
                case .finished:
                    self.status = .loaded
                    print("heroes sink finished\n")
                }
            } receiveValue: { data in
                self.heroes = data.data.results
                print("getHerosV2 heroes: \(String(describing: self.heroes.first))\n")
            }
            .store(in: &suscriptors)
    }
    
    func getHerosTesting(){
        
        let hero1 = Result(
            id: 1009664,
            name: "Thor",
            description: "God of Thunder",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/d/d0/5269657a74350",
                thumbnailExtension: Extension.jpg
            ),
            series: Comics(
                available: 0,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1017295/series",
                items: [],
                returned: 20)
        )

        let hero2 = Result(
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
        )
        
        let hero3 = Result(
            id: 1009282,
            name: "Doctor Strange",
            description: "",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/5/f0/5261a85a501fe",
                thumbnailExtension: Extension.jpg
            ),
            series: Comics(
                available: 902,
                collectionURI: "http://gateway.marvel.com/v1/public/characters/1009282/comics",
                items: [
                    ComicsItem(
                        resourceURI: "ttp://gateway.marvel.com/v1/public/comics/43508",
                        name: "A+X (2012) #9"
                    ),
                    ComicsItem(
                        resourceURI: "http://gateway.marvel.com/v1/public/comics/29317",
                               name: "ACTS OF VENGEANCE CROSSOVERS OMNIBUS (Hardcover)"
                              )
                ],
                returned: 20)
        )
        self.heroes = [hero1, hero2, hero3]
    }
    
}
