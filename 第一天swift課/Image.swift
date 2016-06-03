//
//  image.swift
//  第一天swift課
//
//  Created by Kyle on 2016/6/2.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

class Image {
    static var imageNames = [Image(name:"Image", description:"good"),
                             Image(name:"images-1", description: "bad"),
                             Image(name:"images", description: "yes")]
    
    var name:String
    var description: String?
    
    init(name:String, description:String?){
        self.name = name
        self.description = description
    
    }


}
