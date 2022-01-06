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
    
    init(movies: [Movie]) {
        page = 1
        self.movies = movies
        totalMovies = 0
        totalPages = 0
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
    
    init(title: String){
        posterPath = ""
        overview = ""
        id = 0
        self.title = title
        voteAverage = 0
    }
}
