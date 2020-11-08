//
//  HomeViewModel.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject, UsecaseViewModel {
    var useCase: HomeUsecase!
    @Published var favoriteMovieList = [Media]()
    var isLoading = false
    private var cancelBag = CancelBag()

    init(useCase: HomeUsecase) {
        self.useCase = useCase
        getMostFavoriteMoveList(page: 1)
    }

    func getMostFavoriteMoveList(page: Int) {
        useCase.output(from: HomeUsecase.Input(page: page))
            .favoriteMovieList.replaceError(with: [])
            .assign(to: \HomeViewModel.favoriteMovieList, on: self)
            .store(in: cancelBag)
    }
}
