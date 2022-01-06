//
//  MoviesListVMTests.swift
//  MoviesAppSwiftTests
//
//  Created by AlexR on 6/1/22.
//

import XCTest
@testable import MoviesAppSwift

class MoviesListVMTests: XCTestCase {

    private func makeSUT() -> MoviesListViewModel {
        let sut = MoviesListViewModel(service: MoviesManagerSuccesMock())
        return sut
    }
    
    private func makeSUTWithFailure() -> MoviesListViewModel {
        let sut = MoviesListViewModel(service: MoviesManagerFailureMock())
        return sut
    }
    
    func test_fetchMovies_returnsTwo(){
        let sut = makeSUT()
        
        sut.getMovies { _ in
            XCTAssertEqual(sut.movies.value.count, 2)
        }
    }
    
    func test_filterMovie_findsOneWithText(){
        let sut = makeSUT()
        
        sut.getMovies { _ in
            sut.filterMovie(searchText: "first")
            XCTAssert(sut.filteredMovies.count == 1)
        }
    }
    
    func test_filterMovie_findsTwoWithoutText(){
        let sut = makeSUT()
        
        sut.getMovies { _ in
            sut.filterMovie(searchText: "")
            XCTAssert(sut.filteredMovies.count == 2)
        }
    }
    
    func test_fetchMovies_retursFailure(){
        let sut = makeSUTWithFailure()
        
        sut.getMovies { error in
            XCTAssertEqual(error, MovieServiceError.genericError)
        }
    }

}
