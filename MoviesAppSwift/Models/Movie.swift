//
//  Movie.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

// MARK: - Movie
struct Results: Codable{
    let page: Int
    let movies: [Movie]
    let totalMovies, totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalMovies = "total_results"
        case totalPages = "total_pages"
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
        case posterPath = "poster_path"
        case overview
        case id
        case title
        case voteAverage = "vote_average"
    }
}
