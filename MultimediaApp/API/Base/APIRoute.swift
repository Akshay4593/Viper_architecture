//
//  APIRoute.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

enum APIRoute{
    
    case movies
    case books
    case tvShows
    case music
    
}

extension APIRoute {
    
    private var baseUrl: String {
        return Constant.iTUNES_BASE_PATH
    }
    
    private var apiEndPoint: String {
        return "\(baseUrl)\(apiType)\(version)\(country)\(category)\(subCategory)\(elements)\(numberOfElements)\(fileType)"
    }
    
    
    private var apiType: String {
        switch self {
        case .movies, .books, .music, .tvShows:
            return "/api"
        }
    }
    
    private var version: String {
        switch self {
        case .movies, .books, .music, .tvShows:
            return "/v1"
        }
    }
    
    private var country: String {
        switch self {
        case .movies, .books, .music:
            return "/in"
        
        case .tvShows :
            return "/us"
        }
    }
    
    private var category: String {
        switch self {
            
        case .movies:
            return "/movies"
        case .books:
            return "/books"
        case .tvShows:
            return "/tv-shows"
        case .music:
            return "/apple-music"
        }
    }
    
    private var subCategory: String {
        switch self {
            
        case .movies:
            return "/top-movies"
        case .books:
            return "/top-free"
        case .tvShows:
            return "/top-tv-episodes"
        case .music:
            return "/hot-tracks"
        }
    }
    
    private var elements: String {
        switch self {
        case .movies, .books, .music, .tvShows:
            return "/all"
        }
    }
    
    private var numberOfElements: String {
        switch self {
        case .movies, .books, .music, .tvShows:
            return "/10"
        }
    }
    
    private var fileType: String {
        switch self {
        case .movies, .books, .music, .tvShows:
            return "/explicit.json"
        }
    }
    
    
    var url: URL {
        return URL(string: apiEndPoint)!
    }
    

    var asRoute: Route {
        switch self {
        case .movies, .books, .music, .tvShows:
            return Route.getRoute(path: apiEndPoint)
        }
    }
    
}
