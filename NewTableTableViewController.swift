//
//  NewTableTableViewController.swift
//  第一天swift課
//
//  Created by Kyle on 2016/6/1.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate:class{
    func rightButton()
    
}

class NewTableTableViewController: UITableViewController, ButtonTableViewCellDelegate{

    let imaageCellIdenterfier = "specialcell"

    @IBAction func switchToFirstTab(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 0
    }
    @IBAction func edidTableView(sender: AnyObject) {
        
        self.tableView.setEditing(!self.tableView.editing, animated: true)
    
    }
    
    @IBOutlet var tableController: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "SpecialTableViewCell", bundle: nil), forCellReuseIdentifier: imaageCellIdenterfier)
        
//     self.tableView.registerNib(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "buttoncell")
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows:Int
        
        switch section{
        case 0:
            numberOfRows = 1
            
        default:
            
            numberOfRows = Image.imageNames.count
        
        }
        return numberOfRows
    }

    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0 :
            let cell = tableView.dequeueReusableCellWithIdentifier("buttoncell", forIndexPath: indexPath) as! ButtonTableViewCell
            
            cell.delegate = self
            
            return cell
        
        
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("image cell", forIndexPath: indexPath)
            
            let imageName = Image.imageNames[indexPath.row]
            cell.textLabel?.text = imageName.name
            cell.imageView?.image = UIImage(named:imageName.name)
            
            return cell
            
            
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier(imaageCellIdenterfier, forIndexPath: indexPath) as! SpecialTableViewCell
            
            cell.CellsideLabel.text = "jdiejdiejdkjsdkskajkjdlskdjalknxjnajsnjhdjhdjsnanxjsnjxhasjsnsjdhsajnxjasnjhdjsadjnjxsad"
            
            cell.CellLabel.text = "Kyle"
            
            cell.CellImageView.image = UIImage(named: "images")
            
            return cell
            
        default:
            break
        }
        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title:String?
        switch section{
        case 1:
            title = "stander cell"
        case 2:
            title = "custom cell"
        default:
            break
        }
        return title
    }
    
    
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showimage", sender: Image.imageNames[indexPath.row])
        
    }
    
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showimage"{
            let destinationViewController = segue.destinationViewController as! ImageViewController
          
            let image = sender as? Image
            
            destinationViewController.imageName = image?.name
        }
    }
    
    
    
//    override func tableView(tableView:UITableView, canEditRowAtIndexPath indexPath:NSIndexPath) -> Bool{
//        return true
//    }
//    
//    override func tableView(tableView:UITableView, canMoveRowAtIndexPath indexPath:NSIndexPath)->Bool{
//        return true
//  }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath:NSIndexPath){
        if editingStyle == .Delete{
           Image.imageNames.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath : NSIndexPath) {
        let imageName = Image.imageNames.removeAtIndex(fromIndexPath.row)
        Image.imageNames.insert(imageName, atIndex:toIndexPath.row)
    }
    
    func rightButton() {
        self.tabBarController?.selectedIndex = 0
    }
    
    

}
