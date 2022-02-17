
import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: MyController{
   
    @IBOutlet weak var tableview_outlet: UITableView!{
        didSet{
            tableview_outlet.dataSource = self
            tableview_outlet.delegate = self
            tableview_outlet.rowHeight = 110
            tableview_outlet.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var title_label_outlet: label_desing!{
        didSet{
            title_label_outlet.text = "Kahve Falı"
        }
    }
    
    @IBOutlet weak var arama_textfield_outlet: UITextField!{
        didSet{
            arama_textfield_outlet.placeholder = "Arama Yapın"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func anasayfa_button_action(_ sender: UIButton) {
        showVC(identifierName: "OneViewController")
    }
    
    @IBAction func back_button_action(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}


extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        falci_post_request_json(id: falcilar["data"][indexPath.item]["falci_id"].stringValue)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return falcilar["data"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview_outlet.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
        
        cell.backgroundColor = .clear
        cell.kahve_fali_view_outlet.layer.cornerRadius = 12
        cell.kahve_fali_view_outlet.backgroundColor = UIColor.white
      
        
        
        
        Url_To_Image(url: imageBaseURL + falcilar["data"][indexPath.item]["falci_img"].stringValue , imageView: cell.profil_fotografi_Imageview_outlet)
        cell.profil_fotografi_Imageview_outlet.makeRounded()
        
        cell.falci_adi_label_outlet.text = falcilar["data"][indexPath.item]["falci_name"].stringValue
        
        cell.falci_puani_label_outlet.text = falcilar["data"][indexPath.item]["rating"].stringValue
        
        cell.falci_kredisi_label_outlet.text = "Kredi: " + falcilar["data"][indexPath.item]["kredi"].stringValue
        cell.fal_baktir_button_outlet.setTitle("Fal Baktır", for: .normal)
     
        if falcilar["data"][indexPath.item]["is_sesli_fal"].boolValue == true
        {
            cell.sesli_fal_imageview_outlet.isHidden = false
        }else{
            cell.sesli_fal_imageview_outlet.isHidden = true
        }
        
        if falcilar["data"][indexPath.item]["oneCikar"].boolValue == true && falcilar["data"][indexPath.item]["falci_durumu"].boolValue{
            
            cell.kahve_fali_view_outlet.layer.borderWidth = 2
            cell.kahve_fali_view_outlet.layer.borderColor = UIColor.systemYellow.cgColor
            cell.falci_etiketi_label_outlet.text = "#" + falcilar["data"][indexPath.item]["etiket"].stringValue
        }else{
            
            cell.kahve_fali_view_outlet.layer.borderWidth = 0
            cell.falci_etiketi_label_outlet.text = falcilar["data"][indexPath.item]["etiket"].stringValue
        }
        
        if falcilar["data"][indexPath.item]["falci_durumu"].boolValue == true{
            
        }
        
        return cell
    }
}

extension SecondViewController{
    
   
    func falci_post_request_json(id : String){
        
        let parameters : Parameters = [
            "falci_id" : id
        ]
        
        let url = apiURL + "/getFalci"

        Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
            [self]
            response in
            switch response.result {
            case .success(let value):
                
                falci_detay = JSON(value)
                print(falci_detay)
                
                showVC(identifierName: "ThirdViewController")

               
                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }

}


