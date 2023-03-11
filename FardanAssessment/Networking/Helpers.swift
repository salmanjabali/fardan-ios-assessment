//
//  Helpers.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation

enum RequestMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}

enum Endpoint: String {
    
    case login = "/api/customers/v1/login-mobile"
    case logout = "/api/customers/v1/logout"
}

enum RequestType {
    case noParameters
    case queryParameters
    case pathParameters
    case bodyParameters
    case pathAndBodyParameters
}
