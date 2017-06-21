//
//  AlbumExtensions.swift
//  DesignPatterns
//
//  Created by Administrator on 20.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation


extension Album {
    
/* ae_ - means AlbumExtension */
    func ae_tableRepresentation() -> (titles:[String], values:[String]) {
        return (["Artist", "Album", "Genre", "Year"], [artist, title, genre, year])
    }
}