//
//  ViewController.swift
//  MYOA
//
//  Created by Geek on 1/13/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import UIKit

class StoryNodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var storyNode: StoryNode!
    @IBOutlet weak var adventureImageView: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyNode.promptCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel!.text = storyNode.promptForIndex((indexPath as NSIndexPath).row)
        return cell
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        let nextStoryNode = storyNode.storyNodeForIndex(index: (indexPath as NSIndexPath).row)
        let controller = storyboard?.instantiateViewController(withIdentifier: "StoryNodeViewController") as! StoryNodeViewController
        controller.storyNode = nextStoryNode
        navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func restartButton(_ sender: Any) {
      let controller = self.navigationController!.viewControllers[1]
          let _ = self.navigationController?.popToViewController(controller,animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageName = storyNode.imageName{
             self.adventureImageView?.image = UIImage(named: imageName)
        }
        self.messageTextView.text = storyNode.message
        self.restartButton.isHidden = storyNode.promptCount() > 0
    }


}

