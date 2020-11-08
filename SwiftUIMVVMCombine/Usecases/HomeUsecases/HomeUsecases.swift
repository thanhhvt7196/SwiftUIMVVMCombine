//
//  HomeUsecases.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import Combine

struct HomeUsecase: UsecaseWithParams {
    private let movieRepo: MovieRepositoryType

    init(movieRepo: MovieRepositoryType) {
        self.movieRepo = movieRepo
    }

    func output(from input: Input) -> Output {
        let favoriteMovieList = movieRepo.getMostFavoriteMoveList(page: input.page)
        return Output(favoriteMovieList: favoriteMovieList)
    }
}

extension HomeUsecase {
    struct Input {
        var page: Int
    }

    struct Output {
        var favoriteMovieList: AnyPublisher<[Media], Error>
    }
}
