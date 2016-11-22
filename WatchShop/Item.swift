//
//  Item.swift
//  WatchShop
//
//  Created by QUYNV on 11/21/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name : String?
    var content : String?
    var nameImages : [String] = []
    
    init(name : String, content : String, nameImages : [String]) {
        self.name = name
        self.content = content
        self.nameImages = nameImages
    }
}
