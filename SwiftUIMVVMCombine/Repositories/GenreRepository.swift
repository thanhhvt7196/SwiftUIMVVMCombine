//
//  GenreRepository.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/18/20.
//

import Foundation
import Combine

protocol GenreRepositoryType {
    func getMovieCategories() -> AnyPublisher<GenresResponse, Error>
}

struct GenreRepositoryImpl: GenreRepositoryType {
    func getMovieCategories() -> AnyPublisher<GenresResponse, Error> {
        return APIClient.request(router: .getMovieGenresList, type: GenresResponse.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
