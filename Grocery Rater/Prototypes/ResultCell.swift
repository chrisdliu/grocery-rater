//
//  ResultCell.swift
//  Grocery Rater
//
//  Created by Chris Liu on 11/28/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var price1: UIImageView!
    @IBOutlet weak var price2: UIImageView!
    @IBOutlet weak var price3: UIImageView!
    @IBOutlet weak var price4: UIImageView!
    @IBOutlet weak var price5: UIImageView!
    @IBOutlet weak var quality1: UIImageView!
    @IBOutlet weak var quality2: UIImageView!
    @IBOutlet weak var quality3: UIImageView!
    @IBOutlet weak var quality4: UIImageView!
    @IBOutlet weak var quality5: UIImageView!
    
    func setPrice(stars: Int) {
        let priceStars: [UIImageView] = [price1, price2, price3, price4, price5]
        for i in 0..<stars {
            priceStars[i].image = #imageLiteral(resourceName: "gold_star")
        }
        for i in stars..<5 {
            priceStars[i].image = #imageLiteral(resourceName: "gray_star")
        }
    }
    
    func setQuality(stars: Int) {
        let qualityStars: [UIImageView] = [quality1, quality2, quality3, quality4, quality5]
        for i in 0..<stars {
            qualityStars[i].image = #imageLiteral(resourceName: "gold_star")
        }
        for i in stars..<5 {
            qualityStars[i].image = #imageLiteral(resourceName: "gray_star")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
