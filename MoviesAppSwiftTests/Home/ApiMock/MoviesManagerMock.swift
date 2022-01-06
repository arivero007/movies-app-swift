//
//  MovieManagerMock.swift
//  MoviesAppSwiftTests
//
//  Created by AlexR on 6/1/22.
//

import Foundation
@testable import MoviesAppSwift

class MoviesManagerSuccesMock: MoviesProtocol{
    func getPopularMovies(page: Int,
                          completion: @escaping (Result<Results, MovieServiceError>) -> ()) {
        let results = Results(movies: [Movie(title: "first"), Movie(title: "second")])
        completion(.success(results))
    }
}

class MoviesManagerFailureMock: MoviesProtocol{
    func getPopularMovies(page: Int,
                          completion: @escaping (Result<Results, MovieServiceError>) -> ()) {
        completion(.failure(.genericError))
    }
}
