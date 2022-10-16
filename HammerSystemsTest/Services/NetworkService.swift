//
//  NetworkService.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 16.10.2022.
//

import Foundation

protocol NetworkingProtocol {
    func request(path: String, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: NetworkingProtocol {
    
    func request(path: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: path) else { return }
        
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
       
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
