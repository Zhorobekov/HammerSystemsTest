//
//  FoodDeliveryInteractor.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//  Copyright (c) 2022. All rights reserved.
//


protocol FoodDeliveryBusinessLogic {
    func makeRequest(request: FoodDelivery.Model.Request.RequestType)
}


final class FoodDeliveryInteractor: FoodDeliveryBusinessLogic {
    
    var presenter: FoodDeliveryPresentationLogic?
    var service: FoodDeliveryService?
    
    func makeRequest(request: FoodDelivery.Model.Request.RequestType) {
        if service == nil {
            service = FoodDeliveryService()
        }
        
        switch request {
        case .getMovies:
            service?.getMovies(completion: { [weak self] movies in
                self?.presenter?.presentData(response: .presentMovies(movies: movies))
            })
        }
        
    }
    
}
