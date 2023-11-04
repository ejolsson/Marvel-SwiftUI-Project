//
//  ApiService.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation

let urlBase = "https://gateway.marvel.com"

enum endpoints: String {
    case characters = "/v1/public/characters"
}

class ApiService {

    static let shared = ApiService()
        
    let ts = "1"
    let apiKey: String = { ProcessInfo.processInfo.environment["API_KEY"] ?? ""}()
    let hash: String = { ProcessInfo.processInfo.environment["HASH"] ?? ""}()
    let limit = "5"
    
    // 1. Build the request string
    private func buildURLString (endpoint: String, subPath: String = "", offset: String) -> String {
        
        var urlComponents = URLComponents(string: urlBase)
        urlComponents?.path += endpoint + subPath
        urlComponents?.queryItems = [
            URLQueryItem(name: "ts", value: ts),
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "limit", value: limit),
            URLQueryItem(name: "offset", value: offset)
        ]
        print("buildString: \(String(describing: urlComponents?.url?.absoluteString))")
        return urlComponents?.url?.absoluteString ?? ""
    }
    
    func fetchHeros(completion: @escaping (HeroModel?, Error?) -> Void) {
        
        // 1. Configure the url string
        let urlString = buildURLString(endpoint: endpoints.characters.rawValue, offset: "200")
        
        // 2. Build the URL (proper)
        guard let urlUrl = URL(string: urlString) else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        
        // 3. Build the URL Request
        var urlRequest = URLRequest(url: urlUrl)
        urlRequest.httpMethod = "GET"
        print("urlRequest = \(urlRequest)")
        
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
            
            guard let marvelModel = try? JSONDecoder().decode(HeroModel.self, from: data) else { // HeroModel = full response
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
        let urlString = buildURLString(endpoint: endpoints.characters.rawValue, offset: "")
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
    } // used in getHeroesV1, which is not used
    
    func heroRequest() -> URLRequest {
        
        // 1. Build the string
        let urlString: String = buildURLString(endpoint: "\(endpoints.characters.rawValue)", offset: "200")
        print("heroRequest > urlString: \(urlString)")
        
        // 2. Build the url and request
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        return request
    }
    
    func seriesRequest(heroId: Int) -> URLRequest {
        
        // 1. Build the string
        let urlString = buildURLString(endpoint: endpoints.characters.rawValue, subPath: "/\(heroId)/series", offset: "")
        print("seriesRequest > urlString: \(urlString)\n")
        
        // 2. Build the url and request
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
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
