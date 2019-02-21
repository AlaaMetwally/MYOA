//
//  Connection.swift
//  MYOA
//
//  Created by Geek on 1/15/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation

struct Connection {
    //MARK: properties
    var connectTo: String?
    var prompt: String?
    //MARK: Initialzer
    init(dictionary: [String:String]){
        connectTo = dictionary["connectTo"]!
        prompt = dictionary["prompt"]!
    }
}
