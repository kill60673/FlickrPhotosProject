//
//  ColletCollectionViewController.swift
//  testProject
//
//  Created by harrison on 2020/8/4.
//  Copyright © 2020 harrison. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ColletCell"

class ColletCollectionViewController: UICollectionViewController {
    var preferencesdata = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = (view.bounds.width - 10) / 2
        layout?.itemSize = CGSize(width: width, height: width + 80)
        self.preferencesdata = ImageInfo.ImageInfoInstance.preferences.object(forKey: "imgUrl") as! [String]
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return preferencesdata.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ColletCollectionViewCell
        let photo = preferencesdata[indexPath.item]
        cell.photoimage.image = nil
        cell.imageURL = URL(string: photo)
        NetworkUtility.downloadImage(url: cell.imageURL) { (image) in
            if cell.imageURL == URL(string:photo), let image = image  {
                DispatchQueue.main.async {
                    cell.photoimage.image = image
                }
            }
        }
        return cell
    }
}
