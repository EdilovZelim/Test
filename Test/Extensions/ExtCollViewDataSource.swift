//
//  ExtCollViewDataSource.swift
//  Test
//
//  Created by MacBook on 20.11.2019.
//  Copyright © 2019 Зелимхан Эдилов. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CollectionViewDataSource

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func configCollView() {
        
        collView.dataSource = self
        collView.delegate = self
        collView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        cell.imageURL = photo.imageURL
        return cell
    }
    
    
}
