//
//  ImageViewController.swift
//  第一天swift課
//
//  Created by Kyle on 2016/5/26.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate{

    var imageName:String?
    var imageView:UIImageView?
  
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named:imageName!))

        
        self.scrollView.delegate = self
        
        self.scrollView.addSubview(imageView)
        self.scrollView.contentSize = imageView.frame.size
        
        self.scrollView.maximumZoomScale = 5.0
        self.scrollView.minimumZoomScale = 1
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
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
