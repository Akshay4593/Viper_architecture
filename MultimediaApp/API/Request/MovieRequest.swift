//
//  MovieRequest.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

class MovieRequest: APIRequest<ResponseModel> {
    
    init() {
        super.init(route: APIRoute.movies.asRoute)
    }
    
    override func getParameters() -> [String : Any] {
        return [:]
    }
    
}
