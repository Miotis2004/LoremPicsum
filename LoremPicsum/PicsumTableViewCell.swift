//
//  PicsumTableViewCell.swift
//  LoremPicsum
//
//  Created by Field Employee on 10/27/20.
//

import UIKit

class PicsumTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
