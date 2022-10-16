//
//  FoodDeliveryWorker.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

final class FoodDeliveryService {
    
    var networking: NetworkingProtocol
    var fetcher: DataFetcher
    
    init() {
        self.networking = NetworkService()
        self.fetcher = NetworkDataFetcher(networking: networking)
    }
    
    func getMovies(completion: @escaping ([Movie]) -> Void ) {
        
        fetcher.getMovies { movies in
            completion(movies ?? [])
        }
    }
}
