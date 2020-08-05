//
//  DataResultCollectionViewCell.swift
//  testProject
//
//  Created by harrison on 2020/8/3.
//  Copyright © 2020 harrison. All rights reserved.
//

import UIKit
protocol CollectionViewCellDelegate {
    func collectionviewcellDelegate(sender: DataResultCollectionViewCell)
}
 var imgurl = [String]()
class DataResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var delegate: CollectionViewCellDelegate!
    var imageURL: URL!
    @IBAction func addBt(_ sender: Any) {
        delegate?.collectionviewcellDelegate(sender: self)
        imgurl.append("\(photodata[index_row].imageUrl)")
        print("imgurl",imgurl)
        ImageInfo.ImageInfoInstance.save(imgurl: imgurl)
    }
}
