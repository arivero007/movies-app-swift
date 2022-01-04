//
//  Error+Extensions.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

extension Error {
    
    func getCustomError(code: Int) -> MovieServiceError{
        switch code {
        case 400:
            return .notFoundTokenError
        case 401:
            return .invalidCredentialsError
        case 403:
            return .forbiddenError
        case 404:
            return .notExistError
        case 435:
            return .tokenExpiredError
        default:
            return .genericError
        }
    }
    
}
