//
//  Table1ViewContollerViewController.swift
//  12-Optimize
//
//  Created by lz on 16/5/16.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class Table1ViewContoller: UIViewController,UITableViewDataSource {

    var items: [[String : String]]?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        var array:[[String : String]] = Array()
        for _ in (0...1000) {
            array.append(["name" : randomName(), "image" : randomAvatar()]);
        }
        items = array
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
    }
    
    func randomName() -> String {
        let first = ["Alice", "Bob", "Bill", "Charles", "Dan", "Dave", "Ethan", "Frank"]
        let last = ["Appleseed", "Bandicoot", "Caravan", "Dabble", "Ernest", "Fortune"]
        let index1 = random() % first.count
        let index2 = random() % last.count
        return first[index1] + last[index2]
    }
    
    func randomAvatar() -> String {
        let images = ["Snowman", "Igloo", "Cone", "Spaceship", "Anchor", "Key"]
        let index = random() % images.count
        return images[index]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        let item = items![indexPath.row]
        let filePath = NSBundle.mainBundle().pathForResource(item["image"], ofType: "png")
        cell?.imageView?.image = UIImage.init(contentsOfFile: filePath!)
        cell?.textLabel?.text = item["name"]
        
        cell?.imageView?.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell?.imageView?.layer.shadowOpacity = 0.75
        cell?.imageView?.clipsToBounds = true
        
        cell?.textLabel?.backgroundColor = UIColor.clearColor()
        cell?.textLabel?.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell?.textLabel?.layer.shadowOpacity = 0.5
        
//        cell?.layer.shouldRasterize = true
//        cell?.layer.rasterizationScale = UIScreen.mainScreen().scale
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
