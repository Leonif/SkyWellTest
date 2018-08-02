//
//  NetworkManager.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import Alamofire

public protocol NetworkManager {
    func executeHttpRequest(callback: @escaping (String) -> Void)
}


private class MoyaNetworkManagerImpl: NetworkManager {
    
    
    
    
    
    
    
    func executeHttpRequest(callback: @escaping (String) -> Void) {
        let baseUrl = URL(string: "http://api.openweathermap.org/data/2.5/weather")!
        let parameters: [String: Any] = [
            "lat": 35,
            "lon": 139,
            "APPID": "4a92498353c9514b369ac8651d833537"
        ]
        
        Alamofire.request(baseUrl, method: .get,
                          parameters: parameters,
                          encoding: URLEncoding.default, headers: nil)
            .responseJSON { (responce) in
                
                print(responce)
                callback("15C")
        }
    }
}

public class NetworkManagerFactory {
    public static func createNetworkManager() -> NetworkManager {
        return MoyaNetworkManagerImpl()
    }
}
