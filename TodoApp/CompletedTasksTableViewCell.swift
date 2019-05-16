//
//  CompletedTasksTableViewCell.swift
//  TodoApp
//
//  Created by Khoi Dao on 5/15/19.
//

import UIKit

class CompletedTasksTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
