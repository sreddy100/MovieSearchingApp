//
//  MovieModels.swift
//  MovieSearcher
//
//  Created by Sahil Reddy on 7/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - MovieModels
struct MovieModels: Decodable {
    
    let page, totalResults, totalPages: Int?
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
}

// MARK: - Result
struct Result: Decodable, Hashable, Identifiable{
    
    static func == (lhs: Result, rhs: Result) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let adult: Bool?
    let backdropPath, originalLanguage, originalTitle: String?
    let genreIDS: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}
    
    
