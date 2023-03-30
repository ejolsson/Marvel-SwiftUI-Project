//
//  ApiClient.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation

class ApiClient {

    static let shared = ApiClient()
    
    let urlBase = "https://gateway.marvel.com:443/v1/public/characters"
    
    func fetchMarvelData(completion: @escaping (MarvelModel?, Error?) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "apikey", value: "f0c5210c2332d5d32edc3a40552edb27"),
            URLQueryItem(name: "hash", value: "a4d396a1143f5258c6cced5dc9863a84"),
            URLQueryItem(name: "limit", value: "1"),
            URLQueryItem(name: "offset", value: "200")]
        // prints: ?ts=1&apikey=f0...&hash=a4d....a84&limit=1&offset=200
        
        // 1. Build the string
        let urlString: String = "\(ApiClient().urlBase)\(endpoints.allHeroes.rawValue)"
        
        // 2. Build the URL (proper)
        guard let urlUrl = URL(string: urlString) else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        
        // 3. Build the URL Request
        var urlRequest = URLRequest(url: urlUrl)
        urlRequest.httpMethod = "GET"
        
        
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
            
            guard let marvelModel = try? JSONDecoder().decode(MarvelModel.self, from: data) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            completion(marvelModel, nil)
        }
        task.resume()
        
    }
    
    func prepMarvelDataRequest(filter:String) -> URLRequest {
        
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
        
        print("ApiClient > prepMarvelDataRequest > request: \(request)\n") // print gtg
        return request
    }
}

enum endpoints: String {
    case allHeroes = "?ts=1&apikey=f0c5210c2332d5d32edc3a40552edb27&hash=a4d396a1143f5258c6cced5dc9863a84&limit=4&offset=200"
    case thor = "?ts=1&apikey=f0c5210c2332d5d32edc3a40552edb27&hash=a4d396a1143f5258c6cced5dc9863a84&name=Thor"
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
