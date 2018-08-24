//
//  User.swift
//  AlamoFireDemo
//
//  Created by mahavir on 21/07/17.
//  Copyright © 2017 mobileFirst. All rights reserved.
//

import Foundation
import SwiftyJSON

class User : NSObject
{
    var fullName: String?
    var email : String?
    var phone : Int?
    var photo : String?
    var checkStatus : String?
    var createdAt : String?
    var updatedAt : String?
    var checkInRowId : String?
    var id : Int?
    
    
    init(fullName:String?,email : String?,phone : Int?,photo : String?,checkStatus : String?,createdAt : String?,updatedAt : String,checkInRowId : String?,id : Int?)
    {
        self.fullName = fullName
        self.email = email
        self.phone = phone
        self.photo = photo
        self.checkStatus = checkStatus
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.checkInRowId = checkInRowId
        self.id = id
    }
    
    init(json:JSON)
    {
        self.fullName = json["fullName"].stringValue
        self.email = json["email"].stringValue
        self.phone = json["phone"].intValue
        self.photo = json["photo"].stringValue
        self.checkStatus = json["checkStatus"].stringValue
        self.createdAt = json["createdAt"].stringValue
        self.updatedAt = json["updatedAt"].stringValue
        self.checkInRowId = json["checkInRowID"].stringValue
        self.id = json["id"].intValue
        
    }
    
}
