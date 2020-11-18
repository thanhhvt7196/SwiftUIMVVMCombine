//
//  HomeView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import SwiftUI
import Combine

enum HomeViewInput {
    case refresh
    case loadNextPage
    case setText
}

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var appState: AppState
    @State private var searchText = ""

    private var loadNexPageAction: PassthroughSubject<Int, Never> = .init()
    private var setTextAction: PassthroughSubject<String, Never> = .init()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.setupSubscriptions(HomeViewModel.Input(loadNextPage: loadNexPageAction.prepend(1).eraseToAnyPublisher(),
                                                setText: setTextAction.prepend("abc").eraseToAnyPublisher()))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeHolder: "Shows, Movies, and More")
                    .frame(height: 56)
                HomePagerView(viewModel: HomePagerViewModel(mediaList: viewModel.output.favoriteList))
                    .frame(height: 150)
                    .background(Color.clear)
                    .padding(15)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}
