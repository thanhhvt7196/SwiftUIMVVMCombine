//
//  HomeViewModel.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import Combine

class HomeViewModel: UsecaseViewModel {
    var useCase: HomeUsecase!
    private var cancelBag = CancelBag()

    var state = State(page: 0)
    @Published var output = Output(favoriteList: [], page: 0)

    init(useCase: HomeUsecase) {
        self.useCase = useCase
    }

    func transform(_ input: Input) {
        input.loadNextPage
            .flatMap { [unowned self] page in
                getFavoriteMovieList(page: page)
            }
            .map { [weak self] response -> [Media] in
                guard let self = self else { return [] }
                self.state.page = response.page ?? 1
                self.output.page = self.state.page
                return response.results?.filter { $0.backdropPath != nil } ?? []
            }
            .replaceError(with: [])
            .assign(to: \HomeViewModel.output.favoriteList, on: self)
            .store(in: cancelBag)
    }
}

extension HomeViewModel {
    func getFavoriteMovieList(page: Int) -> AnyPublisher<DiscoverMovieResponse, Error> {
        return useCase.getMostFavoriteMovieList(page: page)
    }
}

extension HomeViewModel {
    struct State {
        var page: Int
    }

    struct Input {
        let loadNextPage: AnyPublisher<Int, Never>
        let setText: AnyPublisher<String, Never>
    }

    struct Output {
        var favoriteList: [Media]
        var page: Int
        var text: String?
    }
}
