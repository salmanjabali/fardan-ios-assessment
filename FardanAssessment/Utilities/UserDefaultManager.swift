//
//  UserDefaultManager.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import Foundation

protocol KeyNamespaceable { }

extension KeyNamespaceable {
    private static func namespace(_ key: String) -> String {
        return "\(Self.self).\(key)"
    }
    
    static func namespace<T: RawRepresentable>(_ key: T) -> String where T.RawValue == String {
        return namespace(key.rawValue)
    }
}

protocol SettingDefaultable: KeyNamespaceable {
    associatedtype SettingDefaultKey: RawRepresentable
}

/// For storing strings in User Defaults
extension SettingDefaultable where SettingDefaultKey.RawValue == String {
    
    static func set(_ string: String, forKey key: SettingDefaultKey) {
        UserDefaults.standard.set(string, forKey: namespace(key))
    }
    
    static func string(forKey key: SettingDefaultKey) -> String? {
        return UserDefaults.standard.string(forKey: namespace(key))
    }
}
 
/// For storing Booleans in User Defaults
extension SettingDefaultable where SettingDefaultKey.RawValue == String {
    
    static func set(_ bool: Bool, forKey key: SettingDefaultKey) {
        UserDefaults.standard.set(bool, forKey: namespace(key))
    }
    
    static func bool(forKey key: SettingDefaultKey) -> Bool {
        return UserDefaults.standard.bool(forKey: namespace(key))
    }
}
