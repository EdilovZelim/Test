//
//  ViewController.swift
//  Test
//
//  Created by MacBook on 19.11.2019.
//  Copyright © 2019 Зелимхан Эдилов. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainViewController: UIViewController {
    @IBOutlet weak var collView: UICollectionView!
    
    var photos: [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPhotos()
    }
    

}





