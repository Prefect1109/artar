//
//  MoviePopularResponse.swift
//  artar
//
//  Created by Prefect on 10.04.2021.
//

import AppKit
import Foundation

struct MoviePopularResponse: Codable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
}

struct Movie: Codable {
    var id: Int
    var release_date: String
    var genre_ids: [Int]
    var title: String
}
