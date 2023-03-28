//
//  HeroViewModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation
import Combine

class HeroViewModel: NSObject { // double check NSObject...
    
    @Published var heroes: MarvelModel?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    func getHeroes() {
        
        ApiClient.shared.fetchMarvelData { [weak self] allheroes, error in
            guard let self = self else { return }
            
            if let allheroes = allheroes {
                self.heroes = allheroes
                print("ViewController > ViewDidLoad > NetworkLayer.shared.fetchHeros > allheroes: \(String(describing: allheroes))\n") // prints 2nd of 4
            } else {
                print("Error fetching heros: ", error?.localizedDescription ?? "")
            }
            print("ViewController > ViewDidLoad > NetworkLayer.shared.fetchHeros > self.heroes: \(String(describing: self.heroes))\n") // prints 3rd of 4
        }
    }
    

    
}
