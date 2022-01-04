//
//  MoviesListViewModel.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

final class MoviesListViewModel{
    
    private var service: MoviesProtocol
    
    var results: Results? {
        didSet{
            if let results = results {
                movies = results.movies
            }
        }
    }
    var movies = [Movie]()
    
    init(service: MoviesProtocol){
        self.service = service
        getMovies()
    }
    
    func getMovies(){
        service.getPopularMovies { results in
            switch results{
            case .success(let results):
                print("Resulst: \(results)")
            case .failure(let e):
                print("Api Error: \(e.localizedDescription)")
            }
        }
    }
    
}
