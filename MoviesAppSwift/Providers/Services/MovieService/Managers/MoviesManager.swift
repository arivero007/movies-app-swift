//
//  MoviesManager.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

class MoviesManager: MoviesProtocol{
    func getPopularMovies(page: Int, completion: @escaping (Result<Results, MovieServiceError>) -> ()) {
        let url = Constants.baseUrl + Constants.EndPoints.urlPopularMovies + Constants.apiKeyQueryItem + "&page=\(page)"
        MovieServiceWrapper.shared.request(url, method: .get, completionHandler: completion)
    }
}
