//
//  SwiftUIMVVMCombineApp.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import SwiftUI
import Combine

@main
struct SwiftUIMVVMCombineApp: App {
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(AppState())
        }
    }
}
