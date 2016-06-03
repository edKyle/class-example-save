//
//  MyViewController.swift
//  第一天swift課
//
//  Created by Kyle on 2016/6/1.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    var imageNames = ["TWolwp2", "Paris-France-evening-lights-bridge_1366x768_wallpaper"]
    
    
    
    @IBOutlet weak var tableViewcontroller: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("image cell", forIndexPath: indexPath)

        let imageName = imageNames[indexPath.row]
        
        cell.textLabel?.text = imageName
        
        cell.imageView?.image = UIImage(named: imageName)
        
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
