//
//  UnsplashFetch.swift
//  imgify
//
//  Created by les on 26/01/2017.
//  Copyright © 2017 come.les69.imgify. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ImgifyFetch{
    let apiKey:String
    let unsplashURL: String
    let AppId: String
    
    
    init() {
        let unsplashConfig = ImgifyFetch.loadDataFromPlist()
        self.apiKey = unsplashConfig["ApiKey"] as! String
        self.unsplashURL = unsplashConfig["UnsplashUrl"] as! String
        self.AppId = unsplashConfig["AppID"] as! String
        
    }
    private class func loadDataFromPlist() -> NSDictionary{
        if let path = Bundle.main.path(forResource: "Unsplash", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)!
        }
        return NSDictionary()
    }
    public func getCuratedPhotos() -> Array<ImgifyPicture> {
        let apiEndpoint = "\(self.unsplashURL)/photos/curated/?client_id=\(self.AppId)"
        var pictures = Array<ImgifyPicture>()
        Alamofire.request(apiEndpoint).responseJSON {   response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                pictures = json.map({(picture) in ImgifyPicture(jsonObject: picture.1)})
                
            case .failure(let error):
                print(error)
            }
        }
        return pictures
    }
    
}
