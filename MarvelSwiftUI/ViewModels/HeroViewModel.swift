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
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    func getHeroes() {
        
        ApiClient.shared.fetchMarvelData { [weak self] marvelResponse, error in
            guard let self = self else { return }
            
            if let marvelResponse = marvelResponse {
                self.marvelResponseMemory = marvelResponse
                print("ViewController > ViewDidLoad > NetworkLayer.shared.fetchHeros > allheroes: \(String(describing: marvelResponse))\n") // prints 2nd of 4
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
}
