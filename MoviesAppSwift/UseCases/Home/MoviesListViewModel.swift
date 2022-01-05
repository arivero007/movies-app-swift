//
//  MoviesListViewModel.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

final class MoviesListViewModel{
    
    private var service: MoviesProtocol
    
    private var results: Results? {
        didSet{
            if let results = results {
                movies.value = results.movies
            }
        }
    }
    
    private(set) var movies = Observer(value: [Movie]())
    
    init(service: MoviesProtocol){
        self.service = service
        getMovies()
    }
    
    func getMovies(){
        service.getPopularMovies { [weak self] results in
            switch results{
            case .success(let results):
                self?.results = results
            case .failure(let e):
                print("Api Error: \(e.localizedDescription)")
            }
        }
    }
    
}
