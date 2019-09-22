//
//  ResponseModel.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation


class ResponseModel : Decodable {
    
    var feed: GeneralDetails?
    
    enum CodingKeys: String, CodingKey {
        case feed
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feed = try values.decode(GeneralDetails.self, forKey: .feed)
    }
    
    
}

