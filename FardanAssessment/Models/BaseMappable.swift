//
//  BaseMappable.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation

struct MappableObject<T>: Codable where T: Codable {
    var status: Bool
    var code: Int
    var message: String
    var response: T?
}
