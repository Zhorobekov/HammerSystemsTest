//
//  NetworkDataFetcher.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 16.10.2022.
//

import Foundation

protocol DataFetcher {
    func getMovies(response: @escaping ([Movie]?) -> Void)
}


struct NetworkDataFetcher: DataFetcher {
    let networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func getMovies(response: @escaping ([Movie]?) -> Void) {
        networking.request(path: API.movies + API.apiKey) { data, error in
            
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
            
            let decoded = self.decodeJson(type: MovieResponse.self, from: data)
            response(decoded?.items)
        }
    }
    
    private func decodeJson<T: Decodable>(type: T.Type, from: Data?) -> T? {
         let decoder = JSONDecoder()
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
