//
//  Photo.swift
//  testProject
//
//  Created by harrison on 2020/8/3.
//  Copyright © 2020 harrison. All rights reserved.
//

import Foundation
struct Photo: Codable {
    let farm: Int
    let secret: String
    let id: String
    let server: String
    let title: String
    var imageUrl: URL {
        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")!
    }
}

struct PhotoData: Codable {
    let photo: [Photo]
}

struct SearchData: Codable {
    let photos: PhotoData
}
