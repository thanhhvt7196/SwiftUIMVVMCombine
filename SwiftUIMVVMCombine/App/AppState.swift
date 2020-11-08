//
//  AppState.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation

enum Root {
    case splash
    case tabbar
    case onboarding
}

final class AppState: ObservableObject {
    @Published var appRootView = Root.splash
}
