//
//  RequestData.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation

struct RequestData {
        
    let path: Endpoint
    var params: [String: Any]
    let httpMethod: RequestMethod
    let requestType: RequestType
    
    var defaultParams: [String: Any] = [
        "session_id": SharedManager.instance.sessionId
    ]
    
    init(path: Endpoint, params: [String: Any] = [:], httpMethod: RequestMethod = .get, requestType: RequestType = .bodyParameters) {
        self.path = path
        self.params = defaultParams.merging(params, uniquingKeysWith: { (first, _) in first })
        self.httpMethod = httpMethod
        self.requestType = requestType
    }
    
}

extension RequestData {
    
    var urlRequest: URLRequest? {
        
        if let componentUrl = url {
            var request = URLRequest(url: componentUrl)
            request.httpMethod = httpMethod.rawValue.uppercased()
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("en", forHTTPHeaderField: "locale")
            if SharedManager.instance.authToken != "" {
                request.setValue("Bearer " + SharedManager.instance.authToken, forHTTPHeaderField: "Authorization")
            }
            
            if requestType == .bodyParameters, params.count > 0 {
                request.httpBody = try? JSONSerialization.data(withJSONObject: params)
            }
            
            if requestType == .pathAndBodyParameters, params.count > 0 {
                request.httpBody = try? JSONSerialization.data(withJSONObject: params)
            }
            return request
        }
        return nil
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api-staging.platinumfitkw.com"
        components.path = path.rawValue
        
        if requestType == .queryParameters {
            var queryParams: [URLQueryItem] = []
            params.forEach({ (key, value) in
                queryParams.append(URLQueryItem(name: key, value: value as? String))
            })
            components.queryItems = queryParams
        }
        
        if requestType == .pathParameters || requestType == .pathAndBodyParameters {
            var path = path.rawValue
            params.forEach({ (key, value) in
                if path.contains(key) {
                    path = path.replacingOccurrences(of: key, with: value as! String)
                }
            })
            components.path = path
        }
        
        return components.url
    }
}
