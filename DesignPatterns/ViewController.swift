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
    @IBOutlet weak var scroller: HorizontalScroller!
    
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
    
        scroller.delegate = self
        reloadScroller()
        
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
    

    
    func reloadScroller() {
        allAlbums = LibraryAPI.sharedInstance.getAlbums()
        if currentAlbumIndex < 0 {
            currentAlbumIndex = 0
        } else if currentAlbumIndex >= allAlbums.count {
            currentAlbumIndex = allAlbums.count - 1
        }
        scroller.reload()
        showDataForAlbum(currentAlbumIndex)
    }
    
    
    
}



extension ViewController: UITableViewDataSource {
}

extension ViewController: UITableViewDelegate {
}


extension ViewController: HorizontalScrollerDelegate {
    
    func horizontalScrollerClickedViewAtIndex(scroller: HorizontalScroller, index: Int) {
        //1
        let previousAlbumView = scroller.viewAtIndex(currentAlbumIndex) as! AlbumView
        previousAlbumView.highlightAlbum(false)
//        previousAlbumView.highlightAlbum(didHighlightView: false)
        //2
        currentAlbumIndex = index
        //3
        let albumView = scroller.viewAtIndex(index) as! AlbumView
        albumView.highlightAlbum(true)
//        albumView.highlightAlbum(didHighlightView: true)
        //4
        showDataForAlbum(index)
    }
    
    
    func numberOfViewsForHorizontalScroller(scroller: HorizontalScroller) -> (Int) {
        return allAlbums.count
    }
    
    
    
    func horizontalScrollerViewAtIndex(scroller: HorizontalScroller, index: Int) -> (UIView) {
        let album = allAlbums[index]
        let albumView = AlbumView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), albumCover: album.coverUrl)
        if currentAlbumIndex == index {
            albumView.highlightAlbum(true)
        } else {
            albumView.highlightAlbum(false)
        }
        return albumView
    }

    
}


