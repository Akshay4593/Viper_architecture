//
//  GeneralDetails.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

class GeneralDetails : Decodable {
    
    var title: String = ""
    var id: String = ""
    var author: Author?
    var links: [Link]?
    var copyright: String = ""
    var country: String = ""
    var icon: String = ""
    var updated: String = ""
    var results: [ItemDetails]
    
    enum CodingKeys: String, CodingKey {
        case title
        case id
        case author
        case links
        case copyright
        case country
        case icon
        case updated
        case results
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        id = try values.decode(String.self, forKey: .id)
        author = try values.decode(Author.self, forKey: .author)
        links = try values.decode([Link].self, forKey: .links)
        copyright = try values.decode(String.self, forKey: .copyright)
        country = try values.decode(String.self, forKey: .country)
        icon = try values.decode(String.self, forKey: .icon)
        updated = try values.decode(String.self, forKey: .updated)
        results = try values.decode([ItemDetails].self, forKey: .results)

        
    }
    
}


class Link : Decodable {
    
    var selfLink: String?
    var alternate: String?
    

    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case alternate
    }

    required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        selfLink = try values.decodeIfPresent(String.self, forKey: .selfLink) ?? ""
        alternate = try values.decodeIfPresent(String.self, forKey: .alternate) ?? ""

    }
    
}

