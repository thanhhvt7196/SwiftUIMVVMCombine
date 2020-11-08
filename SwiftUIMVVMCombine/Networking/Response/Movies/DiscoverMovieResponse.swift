//
//  DiscoverMovieResponse.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation

struct DiscoverMovieResponse: Codable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [Media]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_resutls"
        case totalPages = "total_pages"
        case results
    }
}
