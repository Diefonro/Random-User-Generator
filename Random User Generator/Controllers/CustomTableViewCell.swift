//
//  CustomTableViewCell.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 18/08/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var personImageView: UIImageView?
    @IBOutlet var lblPersonName: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
