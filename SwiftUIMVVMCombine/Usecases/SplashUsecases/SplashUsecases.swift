//
//  SplashUsecases.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/18/20.
//

import Foundation
import Combine

struct SplashUsecases {
    private let genreRepo: GenreRepositoryType

    init(genreRepo: GenreRepositoryType) {
        self.genreRepo = genreRepo
    }

    func getMovieCategories() -> AnyPublisher<GenresResponse, Error> {
        return genreRepo.getMovieCategories()
    }
}
