//
//  playgroundview.swift
//  第一天swift課
//
//  Created by Kyle on 2016/5/24.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

class PlaygroundViewController: UIViewController {
    
    var timer: NSTimer!
      
    
    @IBAction func button(sender: AnyObject) {
        print("hi")
        let alert = UIAlertController(title: "Change Image", message: "plase select an image", preferredStyle: .ActionSheet)
        for image in Image.imageNames {
            let action = UIAlertAction(title: image.name, style: .Default, handler: { (UIAlertAction) in
                self.setImage(image.name)
            })
            alert.addAction(action)
        }
        self.presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func steppChange(sender: AnyObject) {
        let stepper = sender as! UIStepper
        self.imageView.alpha = CGFloat(stepper.value / 10)
        self.label.text = String(format: "alpha: %.02f", stepper.value / 10)
    }
    @IBAction func slide(sender: AnyObject) {
        let slider = sender as! UISlider
        self.imageView.alpha = CGFloat(slider.value / 10)
        self.label.text = String(format: "alpha: %.02f", slider.value / 10)
    }


 
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var load: UIProgressView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func simulateLoading() {
        if load.progress == 1.0 {
            load.hidden = true
            self.imageView.image = UIImage(named: timer.userInfo as! String)
            self.bigImage.image = UIImage(named: timer.userInfo as! String)
            timer.invalidate()
        } else {
            load.progress += 0.1
        }
    }

    func setImage(name: String) {
       // self.imageView.image = UIImage(named: name)
        load.hidden = false
        load.progress = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(PlaygroundViewController.simulateLoading), userInfo: name, repeats: true)
    }
}


    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


