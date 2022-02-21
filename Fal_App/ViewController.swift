//
//  ViewController.swift
//  Fal_App
//
//  Created by Aleyna IŞIK on 17.02.2022.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: MyController {
    
    @IBOutlet weak var title_label_outlet: label_desing!{
        didSet{
            title_label_outlet.text = "GİRİŞ"
        }
    }
    
    @IBOutlet weak var login_view_outlet: UIView!{
        didSet{
            login_view_outlet.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var mail_textfield_outlet: UITextField!{
        didSet{
            mail_textfield_outlet.placeholder = "E - Posta Adresiniz"
            mail_textfield_outlet.addLine(position: .bottom , color: UIColor.gray, width: 1)
        }
    }
    
    @IBOutlet weak var sifre_textfield_outlet: UITextField!{
        didSet{
            sifre_textfield_outlet.placeholder = "Şifreniz"
            sifre_textfield_outlet.addLine(position: .bottom , color: UIColor.gray, width: 1)
        }
    }
    
    @IBOutlet weak var sifremi_unuttum_button_outlet: UIButton! {
        didSet{
            sifremi_unuttum_button_outlet.setTitle("Şifremi Unuttum?", for: .normal)
            sifremi_unuttum_button_outlet.tintColor = UIColor.gray
        }
    }
    
    @IBOutlet weak var Giris_button_outlet: button_desing!{
        didSet{
            Giris_button_outlet.setTitle("Giriş Yap", for: .normal)
        }
    }
    
    @IBOutlet weak var kayit_ol_button_outlet: UIButton! {
        didSet{
            kayit_ol_button_outlet.setTitle("Üye değil misin? Kayıt Ol", for: .normal)
            kayit_ol_button_outlet.tintColor = UIColor.gray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func Giris_button_action(_ sender: UIButton) {
        
        post_request_json(email: String(mail_textfield_outlet.text!), sifre: String(sifre_textfield_outlet.text!))
        
//                post_request_json(email: "mevlut@tutkal.app", sifre: "mirac2011")
    }
    
    
    @IBAction func sifremi_unuttum_button_action(_ sender: UIButton) {
       
        
        sifremi_unuttum_button_outlet.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc private func showAlert(){
        let alert = UIAlertController(
            title: "Şifremi Unuttum",
            message: "E-Posta Adresiniz",
            preferredStyle: .alert)
        
        alert.addTextField{ field in
            field.placeholder = "E-mail Adres"
            field.returnKeyType = .next
            field.keyboardType = .emailAddress
        }
        
        alert.addAction(UIAlertAction(title: "Gönder", style: .default, handler: { _ in
            
            guard let fields = alert.textFields, fields.count == 1 else {
                print("burası çalışıyor")
                return
            }
            let emailField = fields [0]
            guard let email = emailField.text, !email.isEmpty else{
                self.messageBox(title: "Uyarı", message: "Lütfen Boş Bırakmayın")
                return
                
            }
            
            self.sifre_unutma_post_request(email: String(emailField.text!))
            
        }))
        present(alert, animated: true)
        
    }
    
    @IBAction func back_button_action(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension ViewController{
    
    //ALAMOFIRE JSON
    func post_request_json(email : String, sifre:String){
        
        let parameters : Parameters = [
            "email" : email,
            "pass" : sifre,
            
        ]
        
        let url = apiURL + "/giris"
        
        Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
            [self]
            response in
            switch response.result {
            case .success(let value):
                print(value)
                
                 giris = JSON(value)
                
                if giris["isSuccess"].boolValue == true {
                  
                   showVC(identifierName: "OneViewController")
                }
                else {
                    messageBox(title: giris["desc"]["baslik"].stringValue, message: giris["desc"]["mesaj"].stringValue)
                }
                
                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }
    //ALAMOFIRE JSON
    func sifre_unutma_post_request(email : String){
        
        let parameters : Parameters = [
            "email" : email
            
        ]
        
        let url = apiURL + "/sifremiUnuttum"
        
        Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
            [self]
            response in
            switch response.result {
            case .success(let value):
                print(value)
                
                 sifre = JSON(value)
                
                if sifre["isSuccess"].boolValue == true {
                    messageBox(title: sifre["desc"]["baslik"].stringValue, message: sifre["desc"]["mesaj"].stringValue)
                }
                else {
                    messageBox(title: sifre["desc"]["baslik"].stringValue, message: sifre["desc"]["mesaj"].stringValue)
                }
                
                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }
}
