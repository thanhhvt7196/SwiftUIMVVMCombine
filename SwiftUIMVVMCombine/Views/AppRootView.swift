//
//  AppRootView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import SwiftUI

struct AppRootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        switch appState.appRootView {
        case .splash:
            SplashView()
                .environmentObject(appState)
        case .tabbar:
            RootTabbarView()
        default:
            Text("abc")
        }
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView()
    }
}
