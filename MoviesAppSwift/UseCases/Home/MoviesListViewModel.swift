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
                page += 1
                movies.value.append(contentsOf: results.movies)
                filteredMovies .append(contentsOf: results.movies)
            }
        }
    }
    
    private(set) var movies = Observer(value: [Movie]())
    var filteredMovies = [Movie]()
    
    private var isFetchingData = false
    private var page = 1
    
    init(service: MoviesProtocol){
        self.service = service
        getMovies()
    }
    
    // MARK: - Filter
    func filterMovie(searchText: String){
        if searchText != "" {
            filteredMovies = movies.value.filter({ movie in
                return movie.title.lowercased().contains(searchText.lowercased())
            })
        }else{
            filteredMovies = movies.value
        }
    }
    
    // MARK: - Fetch Movies
    func getMovies(){
        if !isFetchingData{
            isFetchingData = true
            service.getPopularMovies(page: page) { [weak self] results in
                switch results{
                case .success(let results):
                    self?.results = results
                case .failure(let e):
                    print("Api Error: \(e.localizedDescription)")
                }
                self?.isFetchingData = false
            }
        }
    }
    
}
