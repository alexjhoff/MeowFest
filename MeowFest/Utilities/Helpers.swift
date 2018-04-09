//
//  Helpers.swift
//  MeowFest
//
//  Created by Alex Hoff on 3/28/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation
import UIKit

extension String {
    public static let baseUrl = "https://chex-triplebyte.herokuapp.com/api/cats?page=0"
}

fileprivate let imageCache = NSCache<NSString, UIImage>()
fileprivate var imgRequest: AnyObject?

extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
        let urlKey = urlString as NSString
        
        if let cachedItem = imageCache.object(forKey: urlKey) {
            self.image = cachedItem
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let imageRequest = ImageRequest(url: url)
        imgRequest = imageRequest
        imageRequest.load { (image: UIImage?) in
            if let image = image {
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: urlKey)
                    self.image = image
                }
            }
        }
    }
}
