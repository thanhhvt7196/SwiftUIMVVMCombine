//
//  ViewModelBased.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Input
    associatedtype Output

    var state: State { get }
    var output: Output { get }

    func transform(_ input: Input)
}

protocol UsecaseViewModel: ViewModel {
    associatedtype UseCase
    var useCase: UseCase! { get set }
}
