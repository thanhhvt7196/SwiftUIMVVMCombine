//
//  MovieHelper.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/18/20.
//

import Foundation

class MovieHelper {
    static func getGenresString(media: Media) -> String {
        var genreArray = [String]()
        if let ids = media.genreIds, ids.count > 0 {
            let allMovieGenres = MovieGenreRealmObject.getAllGenres() ?? []
            let allTVShowsGenres = TVGenreRealmObject.getAllGenres() ?? []
            let genreIds = Set((allTVShowsGenres + allMovieGenres).compactMap { $0.id }).intersection(Set(ids))
            let genreNames = (allTVShowsGenres + allMovieGenres).filter { genre -> Bool in
                return genreIds.contains(genre.id ?? 0)
            }
            genreArray = Array(Set(genreNames.compactMap { $0.name }))
        }
        
        if let genres = media.genres, genres.count > 0 {
            genreArray = genres.compactMap { $0.name }
        }
        return genreArray.joined(separator: " • ")
    }
}
