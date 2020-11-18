//
//  SplashView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import SwiftUI
import Combine

struct SplashView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: SplashViewModel
    @State var showAlert = false
    private var getCategoriesTrigger: PassthroughSubject<Void, Never> = .init()
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.setupSubscriptions(SplashViewModel.Input(getCategoriesTrigger: getCategoriesTrigger.eraseToAnyPublisher()))
    }

    var body: some View {
        ZStack {
            Image(uiImage: Asset.loginBg.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)

            Image(uiImage: Asset.logo.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 50)
        }
        .alert(isPresented: $viewModel.output.showAlert, content: {
            Alert(title: Text(viewModel.output.error?.localizedDescription ?? "abc"))
        })
        .onAppear(perform: {
            if !PersistentManager.shared.hasLaunchedAppBefore {
                getCategoriesTrigger.send(())
                PersistentManager.shared.hasLaunchedAppBefore = true
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.output.goToTabbar = true
                }
            }
        })
        .onReceive(viewModel.$output.dropFirst().map { $0.goToTabbar}) { goToTabbar in
            if goToTabbar {
                appState.appRootView = .tabbar
            }
        }
    }
}
