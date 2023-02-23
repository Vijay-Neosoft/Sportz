//
//  MatchFixtureTableViewCell.swift
//  Sportz
//
//  Created by webwerks on 07/02/23.
//

import UIKit

class MatchFixtureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeVenueLbl: UILabel!
    @IBOutlet weak var teamBLbl: UILabel!
    @IBOutlet weak var teamALbl: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
