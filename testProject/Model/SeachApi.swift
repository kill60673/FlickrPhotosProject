//
//  SeachApi.swift
//  testProject
//
//  Created by harrison on 2020/8/3.
//  Copyright © 2020 harrison. All rights reserved.
//

import Foundation
import UIKit
class SearchApi{
    var photos = [Photo]()
    static let SearchApiInstance = SearchApi()
    func fetchData(text:String,page:Int,collection:UICollectionViewController) {
        if let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=b064f3d32f9e30a5319181bcaafc544c&text=\(text.urlEncoded())&per_page=\(page)&format=json&nojsoncallback=1") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let searchData = try? JSONDecoder().decode(SearchData.self, from: data) {
                    self.photos = searchData.photos.photo
                    DispatchQueue.main.async {
                        collection.collectionView.reloadData()
                    }
                }
            }
            task.resume()
        }
    }
    func getPhotos()->[Photo]{
        return photos
    }
    func getCount()->Int{
        return photos.count
    }
}
