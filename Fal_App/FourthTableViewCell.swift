//
//  FourthTableViewCell.swift
//  Fal_App
//
//  Created by Aleyna IŞIK on 17.02.2022.
//

import UIKit

class FourthTableViewCell: UITableViewCell {

    
    @IBOutlet weak var background_view_outlet: UIView!
    
    @IBOutlet weak var yildiz1_Imageview_outlet: UIImageView!
    @IBOutlet weak var yildiz2_Imageview_outlet: UIImageView!
    @IBOutlet weak var yildiz3_Imageview_outlet: UIImageView!
    @IBOutlet weak var yildiz4_Imageview_outlet: UIImageView!
    @IBOutlet weak var yildiz5_Imageview_outlet: UIImageView!
    
    @IBOutlet weak var yorum_label_outlet: UILabel!
    
    @IBOutlet weak var tarih_label_outlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
