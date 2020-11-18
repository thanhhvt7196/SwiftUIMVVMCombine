//
//  MovieRepository.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import Combine

protocol MovieRepositoryType {
    func getMostFavoriteMoveList(page: Int) -> AnyPublisher<DiscoverMovieResponse, Error>
}

struct MovieRepositoryImpl: MovieRepositoryType {
    func getMostFavoriteMoveList(page: Int) -> AnyPublisher<DiscoverMovieResponse, Error> {
        return APIClient.request(
            router: .discoverMovie(sortBy: MovieSortType.voteAverageDesc,
                                   page: page, genre: nil,
                                   includeVideo: true,
                                   originalLanguage: nil),
            type: DiscoverMovieResponse.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
