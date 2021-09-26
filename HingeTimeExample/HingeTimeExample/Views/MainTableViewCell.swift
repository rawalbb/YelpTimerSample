//
//  MainTableViewCell.swift
//  HingeTimeExample
//
//  Created by Bansri Rawal on 9/25/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ name: String){
        titleLabel.text = name
    }
    
    func updateTime(_ time: Int){
        timerLabel.text = "\(time)s"
    }
    
}
