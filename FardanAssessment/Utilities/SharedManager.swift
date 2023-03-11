//
//  SharedManager.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation

class SharedManager {
    
    static let instance = SharedManager()
    
    var authToken: String {
        get { return UserDefaults.Auth.string(forKey: .authToken) ?? "" }
        set { UserDefaults.Auth.set(newValue, forKey: .authToken) }
    }
    
    var sessionId: String {
        get { return UserDefaults.Auth.string(forKey: .sessionId) ?? "" }
        set { UserDefaults.Auth.set(newValue, forKey: .sessionId)}
    }
    
    var isLoggedIn: Bool {
        get { return UserDefaults.Auth.bool(forKey: .isLoggedIn) }
        set { UserDefaults.Auth.set(newValue, forKey: .isLoggedIn) }
    }
    
}
