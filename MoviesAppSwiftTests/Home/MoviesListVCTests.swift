//
//  MoviesListVCTests.swift
//  MoviesAppSwiftTests
//
//  Created by AlexR on 5/1/22.
//

import XCTest
@testable import MoviesAppSwift

class MoviesListVCTests: XCTestCase {

    private func makeSUT() -> MoviesListViewController {
        
        let sut = MoviesListViewController()
        sut.viewModel = MoviesListViewModel(service: MoviesManager())
        sut.loadViewIfNeeded()
        return sut
    }
    
    func test_viewDidLoad(){
        let sut = makeSUT()
        
        XCTAssert(sut.title == "Movies")
    }

}
