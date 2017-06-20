//
//  LibraryAPI.swift
//  DesignPatterns
//
//  Created by Administrator on 20.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

//import Cocoa
import Foundation


class LibraryAPI: NSObject {

    //1
    class var sharedInstance: LibraryAPI {
        //2
        struct Singleton {
            //3
            static let instance = LibraryAPI()
        }
        //4
        return Singleton.instance
    }
    
    
    
}
