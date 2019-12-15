//
//  TableViewCellController.swift
//  Personal_BMI_Index
//
//  Created by Nisha Tandel on 2019-12-14.
//  Copyright © 2019 Bhavya Shah. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {

    @IBOutlet weak var showHeight: UILabel!
    @IBOutlet weak var showBmi: UILabel!
    @IBOutlet weak var showWeight: UILabel!
    @IBOutlet weak var showName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
