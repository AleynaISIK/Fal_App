
import UIKit
import Kingfisher

class SecondTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var kahve_fali_view_outlet: UIView!
    @IBOutlet weak var profil_fotografi_Imageview_outlet: AnimatedImageView!
    
    @IBOutlet weak var sesli_fal_imageview_outlet: UIImageView!
    
    @IBOutlet weak var falci_adi_label_outlet: UILabel!
    
    @IBOutlet weak var falci_puani_label_outlet: UILabel!
    
    @IBOutlet weak var falci_kredisi_label_outlet: UILabel!
    
    @IBOutlet weak var falci_etiketi_label_outlet: UILabel!
    
    @IBOutlet weak var fal_baktir_button_outlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
