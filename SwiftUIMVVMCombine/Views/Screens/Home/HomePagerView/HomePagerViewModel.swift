//
//  HomePagerViewModel.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/16/20.
//

import Combine

class HomePagerViewModel: ViewModel {
    private var cancelBag = CancelBag()

    var state = State(mediaList: [])
    @Published var output = Output(mediaList: [], selectedMedia: nil)
    
    init(mediaList: [Media]) {
        state.mediaList = mediaList
        output.mediaList = mediaList
    }
    
    func setupSubscriptions(_ input: Input) {
        input.selectedMedia.compactMap { [weak self] index -> Media? in
            guard let self = self, self.state.mediaList.indices.contains(index) else {
                return nil
            }
            return self.state.mediaList[index]
        }
        .assign(to: \HomePagerViewModel.output.selectedMedia, on: self)
        .store(in: cancelBag)
    }
}

extension HomePagerViewModel {
    struct State {
        var mediaList: [Media]
    }

    struct Input {
        let selectedMedia: AnyPublisher<Int, Never>
    }

    struct Output {
        var mediaList: [Media]
        var selectedMedia: Media?
    }
}
