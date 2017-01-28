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
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let unsplashInterface = ImgifyFetch()
        
        unsplashInterface.getCuratedPhotos{ pictures in
            
            let picture = self.getRandomPicture(array: pictures) as? ImgifyPicture
            let url = URL(string: (picture?.defaultUrl)!)
            
            if let data = try? Data(contentsOf: url!){
                self.background.image =  UIImage(data: data)
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
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

