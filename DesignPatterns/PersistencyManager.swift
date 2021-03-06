//
//  PersistencyManager.swift
//  DesignPatterns
//
//  Created by Administrator on 20.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import UIKit

class PersistencyManager: NSObject {

    private var albums = [Album]()
    
    
    override init() {
        //Dummy list of albums
        let album1 = Album(title: "Best of Bowie",
                           artist: "David Bowie",
                           genre: "Pop",
                           coverUrl: "http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png",
                           year: "1992")
        
        let album2 = Album(title: "It's My Life",
                           artist: "No Doubt",
                           genre: "Pop",
                           coverUrl: "http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png",
                           year: "2003")
        
        let album3 = Album(title: "Nothing Like The Sun",
                           artist: "Sting",
                           genre: "Pop",
                           coverUrl: "http://www.coversproject.com/static/thumbs/album/album_sting_nothing%20like%20the%20sun.png",
                           year: "1999")
        
        let album4 = Album(title: "Staring at the Sun",
                           artist: "U2",
                           genre: "Pop",
                           coverUrl: "http://www.coversproject.com/static/thumbs/album/album_u2_staring%20at%20the%20sun.png",
                           year: "2000")
        
        let album5 = Album(title: "American Pie",
                           artist: "Madonna",
                           genre: "Pop",
                           coverUrl: "http://www.coversproject.com/static/thumbs/album/album_madonna_american%20pie.png",
                           year: "2000")
        
        albums = [album1, album2, album3, album4, album5]
    }
    
    
    
    func getAlbums() -> [Album] {
        return albums
    }
    
    func addAlbum(album: Album, index: Int) {
        if (albums.count >= index) {
            albums.insert(album, atIndex: index)
        } else {
            albums.append(album)
        }
    }
    
    func deleteAlbumAtIndex(index: Int) {
        albums.removeAtIndex(index)
    }
    
    
    
    func saveImage(image: UIImage, filename: String) {
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(filename)")
        let data = UIImagePNGRepresentation(image)
        data!.writeToFile(path, atomically: true)
    }
    
    func getImage(filename: String) -> UIImage? {
//        var error: NSError?
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(filename)")
        
        let data: NSData?
        do {
        data = try NSData(contentsOfFile: path, options: .UncachedRead)
        }
        catch {
            return nil
        }
        return UIImage(data: data!)

//        let data = NSData(contentsOfFile: path, options: .UncachedRead, error: &error)
//        if let unwrappedError = error {
//            return nil
//        } else {
//            return UIImage(data: data!)
//        }
    }

    
    
    
    
}
