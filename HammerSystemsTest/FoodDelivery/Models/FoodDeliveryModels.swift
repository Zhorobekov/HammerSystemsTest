//
//  FoodDeliveryModels.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//  Copyright (c) 2022. All rights reserved.
//

enum FoodDelivery {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getMovies
            }
        }
        struct Response {
            enum ResponseType {
                case presentMovies(movies: [Movie])
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayMovies(movieViewModel: MovieViewModel)
            }
        }
    }
}

struct MovieViewModel {
    struct Cell: MovieCellViewModel {
        var title: String
        var subtitle: String
        var imageUrl: String
        var rating: String
        var category: String
    }
    
    let cells: [Cell]
}
