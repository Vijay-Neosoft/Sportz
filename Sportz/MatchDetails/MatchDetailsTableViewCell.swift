//
//  MatchDetailsTableViewCell.swift
//  Sportz
//
//  Created by webwerks on 09/02/23.
//

import UIKit

class MatchDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var bowlingStyle: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var nameOfPlayer: UILabel!
    @IBOutlet weak var playersName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
