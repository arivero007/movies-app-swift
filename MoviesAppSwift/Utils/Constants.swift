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
    
    static let baseUrl = "https://api.themoviedb.org/3"
    static let imagesUrl = "https://image.tmdb.org/t/p/w500"
    
    struct EndPoints{
        static let urlPopularMovies = "/movie/popular"
    }
}
