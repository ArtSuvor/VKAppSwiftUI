//
//  UserDefaultManager.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation

enum UserDefaultsKeys: String {
    case userToken
}

final class UserDefaultManager {
    static let shared = UserDefaultManager()
    private init() {}
    
    private var ud: UserDefaults {
        UserDefaults.standard
    }
    
    var userToken: String? {
        get {
            ud.string(forKey: UserDefaultsKeys.userToken.rawValue)
        }
        set {
            ud.set(newValue, forKey: UserDefaultsKeys.userToken.rawValue)
        }
    }
}
