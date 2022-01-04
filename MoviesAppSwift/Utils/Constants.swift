//
//  Constants.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation
import Alamofire

struct Constants{
    
    static let apiKey = "fb49ae6cd557f43fc2dcc6a56baa7984"
    static let apiKeyQueryItem = "?api_key=\(apiKey)"
    
    static var headers: HTTPHeaders {
        
        var headers = HTTPHeaders()
        headers.add(name: "api_key", value: apiKey)
        
        return headers
    }
    
    static let baseUrl = "https://api.themoviedb.org/3/"
    
    struct EndPoints{
        static let urlPopularMovies = "movie/popular"
        static let urlSearchMovie = "movie/popular"
    }
}
