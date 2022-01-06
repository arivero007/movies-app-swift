//
//  MoviesProtocol.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

protocol MoviesProtocol{
    
    func getPopularMovies(page: Int,
                          completion: @escaping (Result<Results, MovieServiceError>) -> ())
}
