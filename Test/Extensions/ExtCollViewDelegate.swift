//
//  ExtCollViewDelegate.swift
//  Test
//
//  Created by MacBook on 20.11.2019.
//  Copyright © 2019 Зелимхан Эдилов. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CollectionViewDelegate

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photoWidth = collView.bounds.width / 3
        return CGSize(width: photoWidth, height: photoWidth)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        let offset = collView.contentOffset;
        let width  = collView.bounds.size.width;

        let index     = round(offset.x / width);
        let newOffset = CGPoint(x: index * size.width, y: offset.y)

        collView.setContentOffset(newOffset, animated: false)


        coordinator.animate(alongsideTransition: { (context) in
            self.collView.reloadData()
            self.collView.setContentOffset(newOffset, animated: false)
        }, completion: nil)
    }
    
}
