//
//  ViewController.swift
//  imgify
//
//  Created by les on 26/01/2017.
//  Copyright © 2017 come.les69.imgify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var pictureOwner: UIImageView!
    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var ownerLocation: UILabel!
    
    var dailyPictures: Array<ImgifyPicture> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTextField()
        self.initPictureOwner()
        let unsplashInterface = ImgifyFetch()
        
        unsplashInterface.getCuratedPhotos{ pictures in
            
            self.dailyPictures = pictures
            let picture = self.getRandomPicture(array: pictures) as? ImgifyPicture
            self.setBackgroundPicture(url: (picture?.defaultUrl)!)
            self.setPictureOwner(user: (picture?.user)!)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setPictureOwner(user: ImgifyUser){
        let pictureUrl = user.profilePicture
        let url = URL(string: pictureUrl!)
        if let data = try? Data(contentsOf: url!){
            self.pictureOwner.image =  UIImage(data: data)
        }
        self.ownerName.text = user.username!
        self.ownerLocation.text = user.location ?? "N/A"
        
    }
    func setBackgroundPicture(url: String){
        let url = URL(string: url)
        
        if let data = try? Data(contentsOf: url!){
            self.background.image =  UIImage(data: data)
        }
    }
    func initPictureOwner(){
        self.pictureOwner.layer.cornerRadius = self.pictureOwner.frame.size.width / 2
        self.pictureOwner.clipsToBounds = true
        self.pictureOwner.layer.borderWidth = 5
        self.pictureOwner.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.75)
        self.ownerLocation.adjustsFontSizeToFitWidth = true
        self.ownerName.adjustsFontSizeToFitWidth = true
        
        
    }
    func initTextField(){
        self.search.layer.borderWidth = 1
        self.search.layer.borderColor = UIColor.black.cgColor.copy(alpha: 0.75)
//        self.search.layer.cornerRadius = 15.0
        self.search.text = "Search"
    }
    func getRandomPicture(array:Array<Any>) -> AnyObject? {
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        return array[randomIndex] as AnyObject?
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

