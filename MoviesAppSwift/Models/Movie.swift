//
//  Movie.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

// MARK: - Movie
struct Result: Codable{
    let page: Int
    let movies: [Movie]
    let totalMovies, totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalMovies = "totalResults"
        case totalPages
    }
}

// MARK: - Result
struct Movie: Codable {
    let posterPath: String
    let overview: String
    let id: Int
    let title: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case posterPath
        case overview
        case id
        case title
        case voteAverage
    }
}
