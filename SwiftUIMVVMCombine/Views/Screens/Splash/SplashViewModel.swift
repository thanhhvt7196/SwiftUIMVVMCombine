//
//  SplashViewModel.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/18/20.
//

import Foundation
import Combine

class SplashViewModel: UsecaseViewModel {
    var useCases: SplashUsecases!
    private var cancelBag = CancelBag()
    
    @Published var output = Output(goToTabbar: false, error: nil, showAlert: false)
    
    required init(useCases: SplashUsecases) {
        self.useCases = useCases
    }
    
    func setupSubscriptions(_ input: Input) {
        input.getCategoriesTrigger.flatMap { [unowned self] _ in
            getMovieCategories()
        }
        .map { $0.genres ?? [] }
        .sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.output.error = error
                self?.output.showAlert = true
            case .finished:
                break
            }
        } receiveValue: { genres in
            MovieGenreRealmObject.deleteAllGenres()
            MovieGenreRealmObject.save(genres: genres)
        }
        .store(in: cancelBag)
    }
}

extension SplashViewModel {
    private func getMovieCategories() -> AnyPublisher<GenresResponse, Error> {
        return useCases.getMovieCategories()
    }
}

extension SplashViewModel {
    struct Input {
        var getCategoriesTrigger: AnyPublisher<Void, Never>
    }

    struct Output {
        var goToTabbar: Bool
        var error: Error?
        var showAlert: Bool
    }
}
