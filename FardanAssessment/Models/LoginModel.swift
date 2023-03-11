//
//  LoginModel.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation

struct LoginModel: Codable {
    
    struct Response: Codable {
        let token: String
        let customer: Customer
    }

}

struct Customer: Codable, Identifiable {

    let id: Int
    let firstName: String
    let lastName: String?
    let civilId: String?
    let mobileNumber: String
    let email: String
    let rememberToken: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case civilId = "civil_id_number"
        case mobileNumber = "mobile_number"
        case email
        case rememberToken = "remember_token"
    }
}
