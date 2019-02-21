//
//  StoryNode.swift
//  MYOA
//
//  Created by Geek on 1/15/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation

struct StoryNode {
    //MARK: properties
    var message: String
    private var connections: [Connection]
    private var adventure: Adventure
    var imageName: String? {
        return adventure.credits.imageName
    }
    //MARK: Initializer
    init(dictionary: [String:AnyObject],adventure: Adventure) {
        self.adventure = adventure
        message = dictionary["message"] as! String
        message = message.replacingOccurrences(of: "\\n", with: "\n\n")
        connections = [Connection]()
        
        if let connectionsArray = dictionary["connections"] as? [[String:String]]{
            for connectionDictionary: [String:String] in connectionsArray{
                connections.append(Connection(dictionary: connectionDictionary))
            }
        }
    }
    func promptCount() -> Int {
        return connections.count
    }
    func promptForIndex(_ index: Int) -> String{
        return connections[index].prompt!
    }
    func storyNodeForIndex(index: Int) -> StoryNode{
        let storyNodeName = connections[index].connectTo!
        let storyNode = adventure.storyNode[storyNodeName]
        return storyNode!
    }
}
