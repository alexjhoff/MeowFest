//
//  MeowModel.swift
//  MeowFest
//
//  Created by Alex Hoff on 3/28/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation

struct Cat: Codable {
    let title: String?
    let timestamp: String?
    let imageUrl: String?
    let description: String?
    
    // Swift 4.0
    private enum CodingKeys: String, CodingKey {
        case title
        case timestamp
        case imageUrl = "image_url"
        case description
    }
}
