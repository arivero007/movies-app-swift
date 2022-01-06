//
//  MovieDetailVCTests.swift
//  MoviesAppSwiftTests
//
//  Created by AlexR on 6/1/22.
//

import XCTest
@testable import MoviesAppSwift

class MovieDetailVCTests: XCTestCase {

    private func makeSUT() -> MovieDetailViewController{
        let sut = MovieDetailViewController()
        sut.viewModel = MovieDetailViewModel(movie: Movie(title: "test"))
        sut.loadViewIfNeeded()
        return sut
    }
    
    func test_viewDidLoad_setsMovieData(){
        let sut = makeSUT()
        
        XCTAssert(sut.movieTitle.text == "test")
    }

}
