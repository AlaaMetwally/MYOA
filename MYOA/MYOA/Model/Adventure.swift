//
//  Adventure.swift
//  MYOA
//
//  Created by Geek on 1/15/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation

class Adventure{
    //MARK: properties
    var credits: Credits
    var startNode: StoryNode!
    var storyNode: [String : StoryNode]

    //MARK: Initializer
    init(dictionary: [String:AnyObject]) {
        
        let creditsDictionary = dictionary["credits"] as! [String : String]
        let storyNodesDictionary = dictionary["nodes"] as! [String : AnyObject]
        credits = Credits(dictionary: creditsDictionary)
        storyNode = [String : StoryNode]()
        for (key, dictionary) in storyNodesDictionary {
            storyNode[key] = StoryNode(dictionary: dictionary as! [String : AnyObject], adventure: self)
        }
        let startNodeKey = dictionary["startNodeKey"]as! String
        startNode = storyNode[startNodeKey]!
        
    }
}
