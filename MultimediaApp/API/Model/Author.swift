//
//  Author.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

class Author : Decodable {
    
    var authorName: String = ""
    var authorUrl: String = ""
    
    
    enum CodingKeys: String, CodingKey {
        case authorName = "name"
        case authorUrl = "uri"
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        authorName = try values.decode(String.self, forKey: .authorName)
        authorUrl = try values.decode(String.self, forKey: .authorUrl)
        
    }
    
}

