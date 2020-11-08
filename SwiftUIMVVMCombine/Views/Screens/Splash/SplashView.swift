//
//  SplashView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            Image("login_bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)

            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 50)
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.appState.appRootView = .tabbar
            }
        })
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
