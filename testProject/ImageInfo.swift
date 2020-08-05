//
//  ImageInfo.swift
//  testProject
//
//  Created by harrison on 2020/8/4.
//  Copyright © 2020 harrison. All rights reserved.
//

import Foundation
class ImageInfo: NSObject {
    var preferences = UserDefaults.standard
    static let ImageInfoInstance = ImageInfo()
    private override init() {
    }
    func save(imgurl:[String]) {
        preferences.set(imgurl,forKey:"imgUrl")
    }
}
