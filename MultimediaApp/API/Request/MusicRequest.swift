//
//  MusicRequest.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

class MusicRequest: APIRequest<ResponseModel> {
    
    init() {
        super.init(route: APIRoute.music.asRoute)
    }
    
    override func getParameters() -> [String : Any] {
        return [:]
    }
    
}
