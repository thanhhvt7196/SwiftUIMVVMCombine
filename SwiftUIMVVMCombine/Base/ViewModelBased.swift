//
//  ViewModelBased.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype Input
    associatedtype Output

    var output: Output { get }

    func setupSubscriptions(_ input: Input)
}

protocol UsecaseViewModel: ViewModel {
    associatedtype UseCase
    var useCases: UseCase! { get set }
    
    init(useCases: UseCase)}
