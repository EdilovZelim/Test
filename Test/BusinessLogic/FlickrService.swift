//
//  FlickrService.swift
//  Test
//
//  Created by MacBook on 19.11.2019.
//  Copyright © 2019 Зелимхан Эдилов. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



extension MainViewController {
    
    
    
    func getPhotos() {
        fetchPhotos() { photos in
            if let photos = photos {
                self.photos = photos
                self.configCollView()
            }
        }
    }
    
    func fetchPhotos(completion: (([Photos]?) -> Void)? = nil) {
        
        guard let url = URL(string: "https://www.flickr.com/services/rest/") else { return }
        
        let params = ["method" : "\(Parameters.method)",
            "api_key" : "\(Parameters.key)",
            "sort" : "\(Parameters.sort)",
            "per_page" : "\(Parameters.per_page)",
            "format" : "\(Parameters.fomrat)",
            "extras" : "\(Parameters.extras)",
            "nojsoncallback": "\(Parameters.nojsoncallback)"
        ]
        
        Alamofire.AF.request(url, method: .get, parameters: params).validate().responseData { (response) in
            
            switch response.result {
                
            case .success:
                
                guard let data = response.data, let json = try? JSON(data: data)
                    else {
                        completion?(nil)
                        return
                }
                
                let photosJSON = json["photos"]["photo"]
                let photos = photosJSON.arrayValue.compactMap { Photos(json: $0) }
                
                completion?(photos)
                
            case .failure(let error):
                print(error)
                completion?(nil)
            }
            
        }
        
    }
}


