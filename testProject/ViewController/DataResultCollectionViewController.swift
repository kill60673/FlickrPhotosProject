//
//  DataResultCollectionViewController.swift
//  testProject
//
//  Created by harrison on 2020/8/3.
//  Copyright © 2020 harrison. All rights reserved.
//

import UIKit
private let reuseIdentifier = "DataResultCell"
var DataResultCollectionView : UICollectionView!
var index_row = 0
var photodata = [Photo]()
class DataResultCollectionViewController: UICollectionViewController,CollectionViewCellDelegate{
    @IBOutlet var dataResultCollectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    var photos = [Photo]()
    var search = ""
    var perpage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        DataResultCollectionView = dataResultCollectionView
        refreshControl = UIRefreshControl()
        dataResultCollectionView.addSubview(refreshControl)
        let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = (view.bounds.width - 10) / 2
        layout?.itemSize = CGSize(width: width, height: width + 80)
        SearchApi.SearchApiInstance.fetchData(text: self.search , page: self.perpage,collection: self)
        refreshControl.addTarget(self, action: #selector(loadData), for: UIControl.Event.valueChanged)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return SearchApi.SearchApiInstance.getCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.photos = SearchApi.SearchApiInstance.getPhotos()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DataResultCollectionViewCell
        let photo = photos[indexPath.item]
        cell.titleLabel.text = photo.title
        cell.imageURL = photo.imageUrl
        cell.photoImageView.image = nil
        photodata.append(photo)
        NetworkUtility.downloadImage(url: cell.imageURL) { (image) in
            if cell.imageURL == photo.imageUrl, let image = image  {
                DispatchQueue.main.async {
                    cell.photoImageView.image = image
                }
            }
        }
        cell.delegate = self
        return cell
    }
    @objc func loadData(){
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 3){
            SearchApi.SearchApiInstance.fetchData(text: self.search , page: self.perpage,collection: self)
            self.refreshControl.endRefreshing()
        }
    }
    func collectionviewcellDelegate(sender: DataResultCollectionViewCell) {
         guard let tappedIndexPath = dataResultCollectionView.indexPath(for: sender)else {return}
         let tappedindex = tappedIndexPath
         index_row = tappedindex.row
     }
}
