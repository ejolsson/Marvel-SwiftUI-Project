//
//  HeroViewModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation
import Combine

final class HeroViewModel: ObservableObject {
    
    @Published var marvelResponseMemory: MarvelModel?
    @Published var heroes: [HeroModel]? // used for mock data below
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init() {
        getHerosTesting()
    }
    
    func getHeroes() {
        
        ApiClient.shared.fetchMarvelData { [weak self] marvelResponse, error in
            guard let self = self else { return }
            
            if let marvelResponse = marvelResponse {
                self.marvelResponseMemory = marvelResponse
                print("ViewController > ViewDidLoad > NetworkLayer.shared.fetchHeros > allheroes: \(String(describing: marvelResponse))\n") // prints 2nd of 4
                
                let heroArrayFmApi = marvelResponse.data.results // recevie hero portion of Marvel API
                
                var heroModel: [HeroModel] = []
                
                for item in heroArrayFmApi {
                    
                }
                
                
            } else {
                print("Error fetching heros: ", error?.localizedDescription ?? "")
            }
            print("ViewController > ViewDidLoad > NetworkLayer.shared.fetchHeros > self.heroes: \(String(describing: self.marvelResponseMemory))\n") // prints 3rd of 4
        }
    }
    

    
    func getHerosUsingRequest(filter: String){
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: ApiClient.shared.prepMarvelDataRequest(filter: filter))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                
                //TODO OK
                return $0.data
            }
            .decode(type: MarvelModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error buscando heroes")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
                self.marvelResponseMemory = data
            }
            .store(in: &suscriptors)

        
    }
    
    
    
    //For UI Tesing
    func getHerosTesting(){
        let hero1 = HeroModel(id: "001", name: "Thor", photo: "http://i.annihil.us/u/prod/marvel/i/mg/d/d0/5269657a74350.jpg", description: "God of thunder", series: Comics(
            available: 0,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/series",
            items: [ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/comics/30090",
                name: "Age of Heroes (2010) #1"
            )
            ],
            returned: 0
        ))
        
        let hero2 = HeroModel(id: "002", name: "Ironman", photo: "http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55.jpg", description: "Genius, Billioinare", series: Comics(
            available: 0,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/series",
            items: [ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/comics/30090",
                name: "Avengers"
            )
            ],
            returned: 0
        ))
       
        let hero3 = HeroModel(id: "003", name: "Doctor Strange", photo: "http://i.annihil.us/u/prod/marvel/i/mg/5/f0/5261a85a501fe.jpg", description: "Magician", series: Comics(
            available: 0,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1015018/series",
            items: [ComicsItem(
                resourceURI: "http://gateway.marvel.com/v1/public/comics/30090",
                name: "ACTS OF VENGEANCE CROSSOVERS OMNIBUS (2011)"
            )
            ],
            returned: 0
        ))
        
        self.heroes = [hero1, hero2, hero3]
    }
    
}
