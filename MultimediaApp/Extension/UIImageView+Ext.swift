//
//  UIImageView+Ext.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 25/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation


import UIKit

private var imageURLKey: Void?

enum Image: String {
    case icEmptyState = "ic_something_went_wrong"
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}


extension UIImageView {
    
    private var imageURL: String? {
        get {
            return objc_getAssociatedObject(self, &imageURLKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &imageURLKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
        }
    }
    
    func load(url: String, indexPath: IndexPath) {
        if let previousURL = imageURL {
            ImageDownloadManager.shared.changeDownloadPriorityToSlow(of: previousURL)
        }
        imageURL = url
        ImageDownloadManager.shared.download(url: url, indexPath: indexPath, size: self.frame.size) { [weak self](image, url, indexPathh, error) in
            DispatchQueue.main.async {
                if let strongSelf = self, let _image = image, let _path = strongSelf.imageURL, _path == url {
                    strongSelf.imageURL = nil
                    strongSelf.image = _image
                }
            }
        }
    }
    
    func load(url: String) {
        ImageDownloadManager.shared.download(url: url, indexPath: nil, size: self.frame.size) { (image, url, indexPathh, error) in
            if let _image = image {
                DispatchQueue.main.async {
                    self.image = _image
                }
            }
        }
    }
    
    func resizedImageWith(image: UIImage, targetSize: CGSize) -> UIImage? {
        return image.resizedImageWith(image: image, targetSize: targetSize)
    }
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
}

extension UIImage {
    
    func resizedImageWith(image: UIImage, targetSize: CGSize) -> UIImage? {
        let imageSize = image.size
        let newWidth  = targetSize.width  / image.size.width
        let newHeight = targetSize.height / image.size.height
        var newSize: CGSize
        
        if(newWidth > newHeight) {
            newSize = CGSize(width: imageSize.width * newHeight, height: imageSize.height * newHeight)
        } else {
            newSize = CGSize(width: imageSize.width * newWidth,  height: imageSize.height * newWidth)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        image.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}

