//
//  ImageRequest.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 25/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation
import UIKit

class ImageRequest {
    
    private var httpClient: HTTPClientSerivce!
    
    init() {
        httpClient = HTTPClient()
    }
    
    public func download(url: String, completion: @escaping (String, UIImage?, Error?) -> Void) {
        httpClient.downloadTask(url: url) { (result) in
            switch result {
            case .success(let response):
                if let data = try? Data(contentsOf: response), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        completion(url, image, nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(url, nil, APIError.somethingWentWrong)
                    }
                }
                break
                
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(url, nil, error)
                }
                
                break
            }
        }
    }
    
    public func cancel() {
        httpClient.cancel()
    }
    
}
