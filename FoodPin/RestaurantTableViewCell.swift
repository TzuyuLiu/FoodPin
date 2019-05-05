//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by 劉子瑜 on 2019/4/28.
//  Copyright © 2019 劉子瑜. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!{
        
        didSet{
            
            //將圖片設定為圓形
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width/2
            thumbnailImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet var heartImageView: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
