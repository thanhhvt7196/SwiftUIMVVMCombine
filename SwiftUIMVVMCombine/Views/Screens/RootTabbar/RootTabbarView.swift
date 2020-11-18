//
//  RootTabbarView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import SwiftUI

struct RootTabbarView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        StatefulTabView(selectedIndex: $appState.selectedTab) {
            Tab(title: Strings.mypage, image: Asset.tabbarButtonPersonalNormalNormal.image, selectedImage: Asset.tabbarButtonPersonalSelectedNormal.image) {
                MyPageView()
            }
            Tab(title: Strings.home, image: Asset.tabbarButtonDiscoverNormalNormal.image, selectedImage: Asset.tabbarButtonDiscoverSelectedNormal.image) {
                let movieRepo = MovieRepositoryImpl()
                let useCase = HomeUsecase(movieRepo: movieRepo)
                HomeView(viewModel: HomeViewModel(useCase: useCase))
            }
            Tab(title: Strings.chart, image: Asset.tabbarButtonZingchartNormalNormal.image, selectedImage: Asset.tabbarButtonZingchartSelectedNormal.image) {
                ChartView()
            }
            Tab(title: Strings.settings, image: Asset.tabbarSettingsNormalNormal.image, selectedImage: Asset.tabbarSettingsSelectedNormal.image) {
                SettingView()
            }
        }
        .barTintColor(.purpleThemeColor)
    }
}

struct RootTabbarView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabbarView()
    }
}
