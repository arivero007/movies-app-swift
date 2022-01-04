//
//  MovieServiceWrapper.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import Foundation
import Alamofire

final class MovieServiceWrapper: NSObject {
    
    static let shared = MovieServiceWrapper()
    
    var session: Session = {
      let configuration = URLSessionConfiguration.af.default
      configuration.timeoutIntervalForRequest = 20
      return Session(configuration: configuration)
    }()
    
}

extension MovieServiceWrapper {
    
    func request<T: Codable>(_ url: String, method: HTTPMethod,
                             parameters: Parameters? = nil,
                             encoding: ParameterEncoding = URLEncoding.queryString,
                             completionHandler: @escaping (Result<T, MovieServiceError>) -> Void) {
        
        print(url)
        print()
        print(parameters ?? "no-parameters")
                
        let decoder = JSONDecoder()
        
        session.request(url,
                        method: method,
                        parameters: parameters,
                        encoding: encoding)
            .validate()
            .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
            // DEBUG DATA
            if let data = response.data {
                print(String(data: data, encoding: .utf8) ?? "no-data-response")
            }
            
            switch response.result {
            case .success(let decoded):
                completionHandler(.success(decoded))
            case .failure(let e):
                print(e)
                completionHandler(.failure(e.getCustomError(code: e.responseCode ?? 500)))
            }
        }
    }
    
}
