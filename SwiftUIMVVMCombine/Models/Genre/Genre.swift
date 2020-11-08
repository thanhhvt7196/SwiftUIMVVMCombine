//
//  Genre.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation

struct Genre: Codable, Hashable {
    var id: Int?
    var name: String?
}

extension Genre: Equatable {
    static func ==(lhs: Genre, rhs: Genre) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
