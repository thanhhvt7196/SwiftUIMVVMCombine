//
//  HomePagerView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/16/20.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct HomePagerView: View {
    @ObservedObject var viewModel: HomePagerViewModel
    
    var selectedIndex: PassthroughSubject<Int, Never> = .init()
    
    init(viewModel: HomePagerViewModel) {
        self.viewModel = viewModel
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = HomePagerViewModel.Input(selectedMedia: selectedIndex.eraseToAnyPublisher())
        viewModel.transform(input)
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            MoviePagerList(mediaList: viewModel.output.mediaList, geometry: geometry)
                .background(Color.clear)
        })
    }
}
