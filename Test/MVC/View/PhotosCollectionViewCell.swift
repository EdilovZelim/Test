//
//  PhotosCollectionViewCell.swift
//  Test
//
//  Created by MacBook on 20.11.2019.
//  Copyright © 2019 Зелимхан Эдилов. All rights reserved.
//

import UIKit
import Kingfisher


class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImage: UIImageView!
    
    var imageURL: String? {
        didSet {
           
                DispatchQueue.main.async {

                    if let imageURL = self.imageURL, let url = URL(string: imageURL) {

                        self.photoImage.kf.setImage(with: url)

                    } else {

                        self.photoImage.image = nil
                        self.photoImage.kf.cancelDownloadTask()
                    }
                }
            }
        }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageURL = nil
    }
    
}

