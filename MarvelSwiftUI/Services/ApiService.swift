//
//  ApiService.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation

class ApiService {

    static let shared = ApiService()
    
    let urlBase = "https://gateway.marvel.com:443/v1/public/characters"
    
    func fetchHeros(completion: @escaping (HeroModel?, Error?) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "apikey", value: "f0c5210c2332d5d32edc3a40552edb27"),
            URLQueryItem(name: "hash", value: "a4d396a1143f5258c6cced5dc9863a84"),
            URLQueryItem(name: "limit", value: "1"),
            URLQueryItem(name: "offset", value: "200")]
        // prints: ?ts=1&apikey=f0...&hash=a4d....a84&limit=1&offset=200
        
        // 1. Build the string
        let urlString: String = "\(ApiService().urlBase)\(endpoints.allHeroes.rawValue)"
        
        // 2. Build the URL (proper)
        guard let urlUrl = URL(string: urlString) else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        
        // 3. Build the URL Request
        var urlRequest = URLRequest(url: urlUrl)
        urlRequest.httpMethod = "GET"
        
        // 4. Make API Request
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard error == nil else {
                completion(nil, error)
                print("error 1\n")
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.noData)
                print("error 2\n")
                return
            }
            
            guard let marvelModel = try? JSONDecoder().decode(HeroModel.self, from: data) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            completion(marvelModel, nil)
        }
        task.resume()
    }
    
    func fetchSeries(heroId: Int, completion: @escaping (SeriesModel?, Error?) -> Void) {
        
        print("heroID: \(heroId)\n")
        
        // 1. Build the string
        let urlString: String = "\(ApiService().urlBase)/\(heroId)\(endpoints.series.rawValue)&characterId=\(heroId)"
        print("fetchSeries > urlString: \(urlString)\n") // valid url, works in browser
        
        // 2. Build the URL (proper)
        guard let urlUrl = URL(string: urlString) else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        
        // 3. Build the URL Request
        var urlRequest = URLRequest(url: urlUrl)
        urlRequest.httpMethod = "GET"
        
        // 4. Make API Request
        // try adding/replacing '.dataTaskPublisher' 
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard error == nil else {
                completion(nil, error)
                print("error 1\n")
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.noData)
                print("error 2\n")
                return
            }
            
            guard let seriesModel = try? JSONDecoder().decode(SeriesModel.self, from: data) else {
                completion(nil, NetworkError.decodingFailed)
                print("\(data)\n") // prints 10416 bytes
                return
            }
            print("seriesModel: \(seriesModel)\n")
            
            completion(seriesModel, nil)
        }
        task.resume()
    }
    
    func prepHeroRequest() -> URLRequest {
        
        // 1. Build the string
        let urlString : String = "\(urlBase)\(endpoints.allHeroes.rawValue)"
        
        // 2. Build the url and request
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        
        // TODO: - Implement urlComponents instead of url string bits -
        var urlComponents = URLComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "apikey", value: "f0c5210c2332d5d32edc3a40552edb27"),
            URLQueryItem(name: "hash", value: "a4d396a1143f5258c6cced5dc9863a84"),
            URLQueryItem(name: "limit", value: "1"),
            URLQueryItem(name: "offset", value: "200")
        ]
        
        print("ApiService > prepHeroRequest > request: \(request)\n") // print gtg
        return request
    }
    
    func prepSeriesRequest(heroId: Int) -> URLRequest {
        
        // 1. Build the string
        let urlString: String = "\(urlBase)/\(heroId)\(endpoints.series.rawValue)&characterId=\(heroId)"
        
        // 2. Build the url and request
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        
        // TODO: - Implement urlComponents instead of url string bits -
        var urlComponents = URLComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "apikey", value: "f0c5210c2332d5d32edc3a40552edb27"),
            URLQueryItem(name: "hash", value: "a4d396a1143f5258c6cced5dc9863a84"),
            URLQueryItem(name: "limit", value: "1"),
            URLQueryItem(name: "offset", value: "200")
        ]
        
        print("ApiService > prepSeriesRequest > request: \(request)\n") // print gtg
        return request
    }

}

enum endpoints: String {
    case allHeroes = "?ts=1&apikey=f0c5210c2332d5d32edc3a40552edb27&hash=a4d396a1143f5258c6cced5dc9863a84&limit=4&offset=200"
    case thorCharacter = "?ts=1&apikey=f0c5210c2332d5d32edc3a40552edb27&hash=a4d396a1143f5258c6cced5dc9863a84&name=Thor"
    case ironManSeries = "1009368/series?ts=1&apikey=f0c5210c2332d5d32edc3a40552edb27&hash=a4d396a1143f5258c6cced5dc9863a84&limit=5&characterId=1009368"
    case series = "series?ts=1&apikey=f0c5210c2332d5d32edc3a40552edb27&hash=a4d396a1143f5258c6cced5dc9863a84&limit=5"
}

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum NetworkError: Error {
    case malformedURL
    case noData
    case statusCode(code: Int?)
    case decodingFailed
    case unknown
}
