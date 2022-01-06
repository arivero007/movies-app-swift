//
//  Error+Extensions+Tests.swift
//  MoviesAppSwiftTests
//
//  Created by AlexR on 6/1/22.
//

import XCTest
@testable import MoviesAppSwift

class Error_Extensions_Tests: XCTestCase {
    
    private func makeSut() -> Error{
        let sut = MovieServiceError.genericError
        return sut
    }

    func test_getCustomError_returnsnotFoundTokenError(){
        let sut = makeSut()
        XCTAssertEqual(MovieServiceError.notFoundTokenError, sut.getCustomError(code: 400))
    }
    
    func test_getCustomError_returnsinvalidCredentialsError(){
        let sut = makeSut()
        XCTAssertEqual(MovieServiceError.invalidCredentialsError, sut.getCustomError(code: 401))
    }

}
