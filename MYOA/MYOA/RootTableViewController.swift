//
//  RootTableViewController.swift
//  MYOA
//
//  Created by Geek on 1/15/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    var adventures = [Adventure]()
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyNodeController = self.storyboard!.instantiateViewController(withIdentifier: "StoryNodeViewController") as! StoryNodeViewController
        let selectedAdventure = adventures[(indexPath as NSIndexPath).row]
        let firstNodeInTheAdventure = selectedAdventure.startNode
        storyNodeController.storyNode = firstNodeInTheAdventure
        self.navigationController!.pushViewController(storyNodeController, animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adventures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let adventure = adventures[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = adventure.credits.title
        cell.detailTextLabel!.text = adventure.credits.author
        let imageName = adventure.credits.imageName
        cell.imageView!.image = UIImage(named: imageName!)
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let adventurePlistPaths = Bundle.main.paths(forResourcesOfType: "plist", inDirectory: nil)
        for plistPath in adventurePlistPaths{
            if(plistPath as NSString).lastPathComponent != "Info.plist"{
            if let adventureDictionary = NSDictionary(contentsOfFile: plistPath) as? [String : AnyObject]{
                adventures.append(Adventure(dictionary: adventureDictionary))
            }
        }
    }
}
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    
}

