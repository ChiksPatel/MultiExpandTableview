//
//  HeaderSectionCell.swift
//  MultiExpandTable
//
//  Created by Chirag on 14/10/19.
//  Copyright © 2019 Chirag. All rights reserved.
//

import UIKit

class HeaderSectionCell: UITableViewCell {

    @IBOutlet weak var lblHeaderName: UILabel!
    @IBOutlet weak var btnSelection : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
