//
//  APIConstants.swift
//  artar
//
//  Created by Prefect on 10.04.2021.
//

import Cocoa

enum BaseURL: String {
    case api = "https://api.themoviedb.org/3/"
    case imagesBucket = "https://image.tmdb.org/t/p/w500/"
}

struct APIConstants {
    
    static var apiKey = ""
    static var apiKeyAsParameter = "?api_key=" + apiKey
    
    // URLs
    static var getPopularMoviesURL = BaseURL.api.rawValue + "movie/popular"
    static var getImagesByMovieId = BaseURL.imagesBucket.rawValue + "/movie/%d/images"
}
