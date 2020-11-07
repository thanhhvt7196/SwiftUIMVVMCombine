//
//  PersistentManager.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation

enum UserDefaultKeys {
    static let requestToken = "RequestToken"
    static let sessionID = "SessionID"
}


class PersistentManager {
    static let shared = PersistentManager()
    private let defaults = UserDefaults.standard

    var sessionID: String {
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.sessionID)
        }
        get {
            return defaults.string(forKey: UserDefaultKeys.sessionID) ?? ""
        }
    }

    var requestToken: String {
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.requestToken)
        }
        get {
            return defaults.string(forKey: UserDefaultKeys.requestToken) ?? ""
        }
    }
}
