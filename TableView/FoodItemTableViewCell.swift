//
//  FoodItemTableViewCell.swift
//  TableView
//
//  Created by Lalaiya Sahil on 16/01/23.
//

import UIKit

class FoodItemTableViewCell: UITableViewCell {

    @IBOutlet weak var quantityLable: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        minusButton.layer.cornerRadius = 7
        plusButton.layer.cornerRadius = 7
        minusButton.layer.masksToBounds = true
        plusButton.layer.masksToBounds = true
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
