//
//  PostTableViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoTableViewController:
UITableViewController {
    
    var photos : [Photo] = []
    
    
    override func viewDidLoad() {
        
           func getPhotos() {
           
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                if let coreDataPhoto = try? context.fetch(Photo.fetchRequest()) as? [Photo] {
                    
                    if let unwrappedPhoto = coreDataPhoto {
                        photo = unwrappedPhoto
                        tableView.reloadData()
                    }
                    
                }
            }
            
        }
        super.viewDidLoad()
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }
        
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
        cell.textLabel?.text = "Anything you want in here"
    let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption
        tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }


}
