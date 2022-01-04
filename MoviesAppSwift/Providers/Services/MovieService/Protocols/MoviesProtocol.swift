//
//  MoviesProtocol.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

protocol MoviesProtocol{
    
    func getPopularMovies(completion: @escaping (Result<Results, MovieServiceError>) -> ())
    func searchMovie(with id: Int,
                     params: [String: Any],
                     completion: @escaping (Result<Results, MovieServiceError>) -> ())
}
