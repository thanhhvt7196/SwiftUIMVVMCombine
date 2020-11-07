//
//  Result.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation

enum Result<Value, Error> {
    case success(Value)
    case failure(Error)

    init(value: Value) {
        self = .success(value)
    }

    init(error: Error) {
        self = .failure(error)
    }
}
