
import UIKit
import Alamofire
import SwiftyJSON

class OneViewController: MyController {

    @IBOutlet weak var title_label_outlet: label_desing!{
        didSet{
            title_label_outlet.text = "0"
        }
    }
    
    @IBOutlet weak var tarot_fali_label_outlet: UILabel!{
        didSet{
            tarot_fali_label_outlet.text = "Tarot Falı"
        }
    }
    
    @IBOutlet weak var Yildizname_fali_label_outlet: UILabel!{
        didSet{
            Yildizname_fali_label_outlet.text = "Yıldızname Falı"
        }
    }
    
    @IBOutlet weak var katina_fali_label_outlet: UILabel!{
        didSet{
            katina_fali_label_outlet.text = "Katina Falı"
        }
    }
    
    @IBOutlet weak var kahve_fali_label_outlet: UILabel!{
        didSet{
            kahve_fali_label_outlet.text = "Kahve Falı"
        }
    }
    
    @IBOutlet weak var su_fali_label_outlet: UILabel!{
        didSet{
            su_fali_label_outlet.text = "Su Falı"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back_button_action(_ sender: UIButton) {
        dismiss(animated: true)
    }

   @IBAction func kahve_fali_button_action(_ sender: UIButton) {
    
   post_request_json(fal_id: "1")
   }
    
    @IBAction func tarot_fali_button_action(_ sender: UIButton) {
        post_request_json(fal_id: "2")
     }
    
    @IBAction func Yildizname_fali_button_action(_ sender: UIButton) {
        post_request_json(fal_id: "3")
     }
    
    @IBAction func katina_fali_button_action(_ sender: UIButton) {
        post_request_json(fal_id: "4")
     }
    
    @IBAction func su_fali_button_action(_ sender: UIButton) {
        post_request_json(fal_id: "5")
     }
    
    
   /* @IBAction func anasayfa_button_action(_ sender: UIButton) {
        showVC(identifierName: "OneViewController")
    }*/
}
extension OneViewController{
    
    //ALAMOFIRE JSON
    func post_request_json(fal_id :String){
        
        let parameters : Parameters = [
            "fal_id" : fal_id,
            "search" : "",
            "start" : "0",
            "end" : "30"
        ]
        
        let url = apiURL + "/getFalciList"

        Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
            [self]
            response in
            switch response.result {
            case .success(let value):
                
                falcilar = JSON(value)
                print(falcilar)
                showVC(identifierName: "SecondViewController")
                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }
}
