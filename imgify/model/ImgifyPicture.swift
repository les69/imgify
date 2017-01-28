//
//  UnsplashPicture.swift
//  imgify
//
//  Created by les on 27/01/2017.
//  Copyright © 2017 come.les69.imgify. All rights reserved.
//

import Foundation
import SwiftyJSON

class ImgifyPicture {
    
    let id:String?
    let creationTime: Date?
    let width: Int?
    let height: Int?
    let likes: Int?
    let links: Dictionary<String, AnyObject>
    let urls: Dictionary<String, AnyObject>
    let user: ImgifyUser
    
    
    init(jsonObject:JSON) {
        
        id = jsonObject["id"].string
        creationTime = ImgifyPicture.convertStringtoDate(date: jsonObject["created_at"].string)
        width = jsonObject["width"].int
        height = jsonObject["height"].int
        likes = jsonObject["likes"].int
        links = jsonObject["links"].dictionaryObject! as Dictionary<String, AnyObject>
        urls = jsonObject["urls"].dictionaryObject! as Dictionary<String, AnyObject>
        user = ImgifyUser(jsonUser: JSON(jsonObject["user"].dictionaryObject!))
        
        
    }
    private class func convertStringtoDate(date:String?) -> Date? {
        let convertedDate = DateFormatter()
        convertedDate.locale = Locale(identifier: "en_US_POSIX")
        convertedDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        convertedDate.timeZone = TimeZone(secondsFromGMT: 0)
        
        let string = date
        let return_date = convertedDate.date(from: string!)
        return return_date
    }
}
