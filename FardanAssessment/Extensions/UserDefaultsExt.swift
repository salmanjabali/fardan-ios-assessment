//
//  UserDefaultsExt.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation

extension UserDefaults {
    
    struct Auth: SettingDefaultable {
        private init() { }
        
        enum SettingDefaultKey: String {
            case isLoggedIn
            case authToken
            case sessionId
        }
    }
}
