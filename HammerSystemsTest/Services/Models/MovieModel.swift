//
//  Response.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 16.10.2022.
//

struct MovieResponse: Decodable {
    let items: [Movie]
}

struct Movie: Decodable {
    let title: String
    let plot: String
    let image: String
    let imDbRating: String
    let genreList: [Genre]
    var genre: String { 
        genreList.first?.key ?? ""
    }
}

struct Genre: Decodable {
    let key: String
    let value: String
}
