//
//  FoodDeliveryPresenter.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

protocol FoodDeliveryPresentationLogic {
    func presentData(response: FoodDelivery.Model.Response.ResponseType)
}


final class FoodDeliveryPresenter: FoodDeliveryPresentationLogic {
    
    weak var viewController: FoodDeliveryDisplayLogic?
    
    func presentData(response: FoodDelivery.Model.Response.ResponseType) {
        switch response {
        case .presentMovies(movies: let movies):
            let cells = movies.map { movie in
                MovieViewModel.Cell(title: movie.title, subtitle: movie.plot, imageUrl: movie.image, rating: movie.imDbRating, category: movie.genre)
            }
            
            let sortedCells = cells.sorted(by: {$0.category < $1.category})
            
            let movieViewModel = MovieViewModel(cells: sortedCells)
            viewController?.displayData(viewModel: .displayMovies(movieViewModel: movieViewModel))
        }
    }
    
}
