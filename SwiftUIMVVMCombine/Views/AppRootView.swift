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
            let genreRepo = GenreRepositoryImpl()
            let splashUseCases = SplashUsecases(genreRepo: genreRepo)
            let splashViewModel = SplashViewModel(useCases: splashUseCases)
            SplashView(viewModel: splashViewModel)
                .environmentObject(appState)
        case .tabbar:
            RootTabbarView()
                .environmentObject(appState)
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
