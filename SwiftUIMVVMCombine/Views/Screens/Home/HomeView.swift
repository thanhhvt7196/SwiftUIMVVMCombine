//
//  HomeView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            VStack {
                Button {
                    self.viewModel.favoriteMovieList = Array(self.viewModel.favoriteMovieList.prefix(3))
                } label: {
                    Text("get 3 first items")
                }

                List {
                    ForEach(viewModel.favoriteMovieList) {
                        Text($0.title ?? "")
                    }
                }
            }
        }
    }
}
