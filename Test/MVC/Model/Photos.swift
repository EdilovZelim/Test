//
//  Photos.swift
//  Test
//
//  Created by MacBook on 19.11.2019.
//  Copyright © 2019 Зелимхан Эдилов. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Photos {
    
    var imageURL: String
    
    init?(json: JSON) {
        
        guard let urlQ = json["url_q"].string else { return nil }
        
        self.imageURL = urlQ
    }
}
