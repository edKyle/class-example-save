//
//  ButtonTableViewCell.swift
//  第一天swift課
//
//  Created by Kyle on 2016/6/3.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate:class{
    func rightButton()
}

class ButtonTableViewCell: UITableViewCell {
    
    weak var delegate:ButtonTableViewCellDelegate?
    
    
    @IBAction func rightButton(sender: AnyObject) {
        
        delegate?.rightButton()
        
    }
    @IBOutlet weak var leftButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
