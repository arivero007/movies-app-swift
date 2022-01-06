//
//  MovieDetailVMTests.swift
//  MoviesAppSwiftTests
//
//  Created by AlexR on 6/1/22.
//

import XCTest
@testable import MoviesAppSwift

class MovieDetailVMTests: XCTestCase {

    private func makeSut() -> MovieDetailViewModel{
        let sut = MovieDetailViewModel(movie: Movie(title: "test"))
        return sut
    }
    
    func test_viewModel_initsWithMovie(){
        let sut = makeSut()
        
        XCTAssertEqual(sut.movie.title, "test")
    }
    

}
