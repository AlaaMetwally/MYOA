//
//  Credits.swift
//  MYOA
//
//  Created by Geek on 1/15/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation
// MARK: properties
struct Credits{
    var key: String?
    var author: String?
    var imageName: String?
    var source: String?
    var title: String?
    
    //MARK: Initializer
    init(dictionary: [String:String]) {
        author = dictionary["author"] as String?
        key = dictionary["key"] as String?
        imageName = dictionary["image"] as String?
        source = dictionary["source"] as String?
        title = dictionary["title"] as String?
    }
    
}
