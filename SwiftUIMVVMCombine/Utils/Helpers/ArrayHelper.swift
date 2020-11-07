//
//  ArrayHelper.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation

class ArrayHelper {
    static func combine<T>(arrays:[[T]]) -> [T] {
        let maxCount = arrays.reduce(0) { max($0, $1.count) }
        var result = [T]()

        for i in 0..<maxCount {
            for array in arrays {
                if i < array.count {
                    result.append(array[i])
                }
            }
        }
        return result
    }
}
