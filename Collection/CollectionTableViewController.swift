//
//  CollectionTableViewController.swift
//  Collection
//
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class CollectionTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemController.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel?.text = itemController.items[indexPath.row].name
        
        return cell
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowItemDetail" {
            
            guard let detailVC = segue.destination as? ItemDetailViewController ,
                let indexPath = tableView.indexPathForSelectedRow else {return}
            
            detailVC.itemController = itemController
            detailVC.item = itemController.items[indexPath.row]
            
        } else if segue.identifier == "ShowAddItem" {
            guard let detailVC = segue.destination as? ItemDetailViewController else {return}
            detailVC.itemController = itemController
        }
    }
    
    var itemController = ItemController()

}
