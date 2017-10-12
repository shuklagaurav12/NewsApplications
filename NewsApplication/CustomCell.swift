//
//  CustomCell.swift
//  NewsApplication
//
//  Created by Gourav Shukla on 16/08/17.
//  Copyright © 2017 Fishbowl. All rights reserved.
//

import UIKit


class CustomCell: UITableViewCell {
    @IBOutlet var newsImg: UIImageView!
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCellWithSignUpData(_ dict : [String: AnyObject],index : Int) -> Void
    {
    
        if (dict["author"] as? String != nil)
        {
            newsTitle.text = dict["author"] as? String
        }
        if (dict["description"] as? String != nil)
        {
            newsDescription.text = dict["description"] as? String
        }
        if (dict["urlToImage"] as? String != nil)
        {
        
            let imageUrl = dict["urlToImage"] as? String
            
            newsImg.sd_setImage(with: URL(string: imageUrl!), placeholderImage: UIImage(named: ""))
   }
    }
    
}
