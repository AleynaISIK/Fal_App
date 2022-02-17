

import UIKit
import Kingfisher

class ThirdViewController: MyController {
    
    
    @IBOutlet weak var title_label_outlet: UILabel!{
        didSet{
            title_label_outlet.text = falci_detay["data"]["falci_name"].stringValue
        }
    }
    
    @IBOutlet weak var falciadi_label_outlet: UILabel!{
        didSet{
            falciadi_label_outlet.text = falci_detay["data"]["falci_name"].stringValue
        }
    }
    
    @IBOutlet weak var imageview_outlet: AnimatedImageView!{
        didSet{
            Url_To_Image(url: imageBaseURL + falci_detay["data"]["falci_img"].stringValue , imageView: imageview_outlet)
            imageview_outlet.makeRounded()
        }
    }
    
    
    
    @IBOutlet weak var falcipuan_label_outlet: UILabel!{
        didSet{
            falcipuan_label_outlet.text = falci_detay["data"]["rating"].stringValue
            
        }
    }
    
    @IBOutlet weak var falcietiket_label_outlet: UILabel!{
        didSet{
            falcietiket_label_outlet.text = falci_detay["data"]["etiket"].stringValue
            falcietiket_label_outlet.textColor = UIColor.purple
            
        }
    }
    
    @IBOutlet weak var falcihakkinda_label_outlet: UILabel!{
        didSet{
            falcihakkinda_label_outlet.text = falci_detay["data"]["desc"].stringValue.htmlToString
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func back_button_action(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
extension String {
    private var htmlToAttributedString: NSAttributedString? {
            guard let data = data(using: .utf8) else { return nil }
            do {
                return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            } catch {
                return nil
            }
        }
        var htmlToString: String {
            return htmlToAttributedString?.string ?? ""
        }
}
