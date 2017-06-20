//
//  HTTPClient.swift
//  DesignPatterns
//
//  Created by Administrator on 20.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import UIKit

class HTTPClient {
    
    
    func getRequest(url: String) -> (AnyObject) {
        return NSData()
    }
    
    func postRequest(url: String, body: String) -> (AnyObject){
        return NSData()
    }
    
    func downloadImage(url: String) -> UIImage {
        let aUrl = NSURL(string: url)
        let data = NSData(contentsOfURL: aUrl!)
        let image = UIImage(data: data!)
        return image!
    }

    
    
}