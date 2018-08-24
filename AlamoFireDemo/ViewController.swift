//
//  ViewController.swift
//  AlamoFireDemo
//
//  Created by mahavir on 21/07/17.
//  Copyright © 2017 mobileFirst. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tblView: UITableView!
    
//    var arrResult : Array<Dictionary<String,Any>> = Array()
//    var dictMain : Dictionary<String,Any> = Dictionary()
    
    var arrRes = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // PostMethod()
       // GetMethod()
        imageUpload()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell") as? DisplayTableViewCell
        
       var dict = arrRes[(indexPath as NSIndexPath).row]
        
       cell?.txtName.text = dict["name"] as? String
       cell?.lblDisply.text = dict["id"] as? String
        
        let imageUrlString = dict["icon"]
        
        let imageUrl:URL = URL(string: imageUrlString as! String)!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        
        let image = UIImage(data: imageData as Data)
        cell?.imageUpload.image = image
       return cell!
        
    }

    func PostMethod()
    {
    
        let newUrl = "http://swagatam-api.herokuapp.com/guest/add"
        
        var parameter : Dictionary<String,Any> = Dictionary()
       
        parameter = ["fullName":"Aditya Raval","email":"adityaraval@gmail.com","phone":"9033971572","organizationName":"MobileFirst","host":"Milan Pansuriya","hostPhone":"8958565245","purpose":"Playing cricket","signature":"www.gmail.com","photo":"www.facebook.com"]
        
        
            URLManager().URLCall(method: .post, parameters: parameter, url: newUrl) {(responseDict) in
            
            print(responseDict)
        
            
        }
    }
    
    func GetMethod()
    {
        let getUrl = "http://swagatam-api.herokuapp.com/guest/get"
        
        URLManager().URLCall(method: .get, parameters: nil, url: getUrl){(json) in
            
            
            var arrayUser :[User] = [User]()
            
            for data in json["data"].arrayValue
            {
                let user:User = User(json:data)
                arrayUser.append(user)
            }
        }

    }
  
   
    func imageUpload()
    {
        let parameters = [
            "file_name": "swift_file.jpeg"
        ]
        
        let image = UIImage(named: "img.png")
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(UIImagePNGRepresentation(image!)!, withName: "image", fileName: "swift_file.jpeg", mimeType: "image/png")
            
            for (key, value) in parameters {
                
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        },to: "http://swagatam-api.herokuapp.com/guest/add")
            
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    
                    var dictMain : Dictionary<String,Any>!
                    dictMain = response.result.value as! Dictionary<String, Any>
                    
                    if  let imageResponse = dictMain["results"]
                    {
                        self.arrRes = imageResponse as! [[String : AnyObject]]
                        print("JSON: \(self.arrRes)")
                        self.tblView.reloadData()
                    }
                }
                
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                print(encodingError)
            }
    
    
            }
            }
    

    }



