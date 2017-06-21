//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Administrator on 20.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController /* , UITableViewDataSource, UITableViewDelegate */ {

    @IBOutlet weak var dataTable: UITableView!
    @IBOutlet weak var toolbar: UIToolbar!
    
    
    private var allAlbums = [Album]()
    private var currentAlbumData : (titles:[String], values:[String])?
    private var currentAlbumIndex = 0
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1
        self.navigationController?.navigationBar.translucent = false
        currentAlbumIndex = 0
        
        //2
        allAlbums = LibraryAPI.sharedInstance.getAlbums()
        
        // 3
        // the uitableview that presents the album data
        dataTable.delegate = self
        dataTable.dataSource = self
        dataTable.backgroundView = nil
        view.addSubview(dataTable!)
    
        self.showDataForAlbum(currentAlbumIndex)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func showDataForAlbum(albumIndex: Int) {
        // defensive code: make sure the requested index is lower than the amount of albums
        if (albumIndex < allAlbums.count && albumIndex > -1) {
            //fetch the album
            let album = allAlbums[albumIndex]
            // save the albums data to present it later in the tableview
            currentAlbumData = album.ae_tableRepresentation()
        } else {
            currentAlbumData = nil
        }
        // we have the data we need, let's refresh our tableview
        dataTable!.reloadData()
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let albumData = currentAlbumData {
            return albumData.titles.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        if let albumData = currentAlbumData {
            cell.textLabel!.text = albumData.titles[indexPath.row]
            print (albumData.titles[indexPath.row])
            print (albumData.values[indexPath.row])
            
            cell.detailTextLabel?.text = albumData.values[indexPath.row]
//            cell.detailTextLabel!.text = albumData.values[indexPath.row]
        }
        return cell
    }
    

}



extension ViewController: UITableViewDataSource {
}

extension ViewController: UITableViewDelegate {
}

