//
//  UnsplashUser.swift
//  imgify
//
//  Created by les on 27/01/2017.
//  Copyright © 2017 come.les69.imgify. All rights reserved.
//

import Foundation
import SwiftyJSON

class ImgifyUser{
    
    let id: String?
    let username:String?
    let name:String?
    let firstName:String?
    let lastName:String?
    let portfolioUrl:String?
    let bio:String?
    let location:String?
    let profilePicture:String?
    
    
    init(jsonUser:JSON) {
        self.id = jsonUser["id"].string
        self.username = jsonUser["username"].string
        self.name = jsonUser["name"].string
        self.bio = jsonUser["bio"].string
        self.location = jsonUser["location"].string
        self.portfolioUrl = jsonUser["portfolio_url"].string
        self.firstName = jsonUser["first_name"].string
        self.lastName  = jsonUser["last_name"].string
        
        self.profilePicture = ImgifyUser.getProfilePicture(picturesLinks: jsonUser["profile_image"].dictionaryObject as! Dictionary<String, AnyObject>)
        
    }
    private class func getProfilePicture(picturesLinks: Dictionary<String, AnyObject>) -> String? {
        if let link = picturesLinks["medium"] {
            return link as? String
        }
        else{
            return String()
        }
    }
}
