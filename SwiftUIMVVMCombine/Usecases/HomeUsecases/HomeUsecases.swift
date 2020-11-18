//
//  HomeUsecases.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import Combine

struct HomeUsecase {
    private let movieRepo: MovieRepositoryType

    init(movieRepo: MovieRepositoryType) {
        self.movieRepo = movieRepo
    }

    func getMostFavoriteMovieList(page: Int) -> AnyPublisher<DiscoverMovieResponse, Error> {
        return movieRepo.getMostFavoriteMoveList(page: page)
            .eraseToAnyPublisher()
    }
}
