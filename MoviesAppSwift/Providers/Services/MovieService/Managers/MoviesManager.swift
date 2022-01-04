//
//  MoviesManager.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

class MoviesManager: MoviesProtocol{
    func getPopularMovies(completion: @escaping (Result<Results, MovieServiceError>) -> ()) {
        let url = Constants.baseUrl + Constants.EndPoints.urlPopularMovies + Constants.apiKeyQueryItem
        MovieServiceWrapper.shared.request(url, method: .get, completionHandler: completion)
    }
    
    func searchMovie(with id: Int, params: [String: Any], completion: @escaping (Result<Results, MovieServiceError>) -> ()) {
        let url = Constants.baseUrl + Constants.EndPoints.urlPopularMovies

        MovieServiceWrapper.shared.request(url,
                                           method: .get,
                                           parameters: params,
                                           completionHandler: completion)
    }
}
