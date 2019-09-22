//
//  ItemDetails.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

class ItemDetails : Decodable {

    var artistName: String?
    var id: String?
    var releaseDate: String?
    var name: String?
    var collectionName: String?
    var kind: String?
    var copyright: String?
    var contentAdvisoryRating: String?
    var artistUrl: String?
    var artworkUrl100: String?
    var url: String?
    var genres: [Genres] = []
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case id
        case releaseDate
        case name
        case collectionName
        case kind
        case copyright
        case contentAdvisoryRating
        case artistUrl
        case artworkUrl100
        case url
        case genres
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName) ?? ""
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName) ?? ""
        kind = try values.decodeIfPresent(String.self, forKey: .kind) ?? ""

        copyright = try values.decodeIfPresent(String.self, forKey: .copyright) ?? ""
        contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating) ?? ""
        artistUrl = try values.decodeIfPresent(String.self, forKey: .artistUrl) ?? ""
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        genres = try values.decodeIfPresent([Genres].self, forKey: .genres) ?? []

        
    }
    
    
    
}

class Genres : Decodable {
    
    var genreId: String = ""
    var name: String = ""
    var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case genreId
        case name
        case url
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        genreId = try values.decode(String.self, forKey: .genreId)
        name = try values.decode(String.self, forKey: .name)
        url = try values.decode(String.self, forKey: .url)

    }
}
