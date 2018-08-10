//
//  NetworkManager.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkHttpMethod = HTTPMethod

public protocol NetworkManager {
    func executeHttpRequest(requestType: RequestType, callback: @escaping (Data?) -> Void)
}

public struct RequestType {
    var method: NetworkHttpMethod
    var baseURL: URL
    var parameters: [String: Any]
}

private class NetworkManagerImpl: NetworkManager {
    
    func executeHttpRequest(requestType: RequestType, callback: @escaping (Data?) -> Void) {
        Alamofire.request(requestType.baseURL,
                          method: requestType.method,
                          parameters: requestType.parameters,
                          encoding: URLEncoding.default, headers: nil)
            .responseJSON { (responce) in
                callback(responce.data)
        }
    }
}

public class NetworkManagerFactory {
    public static func createNetworkManager() -> NetworkManager {
        return NetworkManagerImpl()
    }
}



