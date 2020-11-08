//
//  Usecase.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation

protocol Usecase {
    associatedtype Output
    func output() -> Output
}

protocol UsecaseWithParams {
    associatedtype Input
    associatedtype Output
    func output(from input: Input) -> Output
}
