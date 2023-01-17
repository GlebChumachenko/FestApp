//
//  CustomViewCell.swift
//  diploma
//
//  Created by Gleb Chumachenko on 29.09.22.
//

import UIKit

class CustomViewCell: UITableViewCell {
    

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var electedButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 55
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var isElected: Bool = false
    
    @IBAction func electedAction(_ sender: Any) {
        
        if isElected == false  {
            electedButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            isElected = true
        }
        else {
            electedButton.setImage(UIImage(systemName: "star"), for: .normal)
            isElected = false
        }
        
        UserDefaults.standard.set(isElected, forKey: "isElected")
        
    }

    
    
}
