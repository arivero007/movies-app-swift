//
//  NetworkConnectivity.swift
//  MoviesAppSwift
//
//  Created by AlexR on 5/1/22.
//

import Alamofire

class NetworkConnectivity {
    class func isConnected() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
