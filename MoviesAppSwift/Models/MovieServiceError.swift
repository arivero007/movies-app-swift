//
//  MovieServiceError.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation

enum MovieServiceError: String, Error{
    case notFoundTokenError
    case invalidCredentialsError
    case forbiddenError
    case notExistError
    case tokenExpiredError
    case genericError
}
