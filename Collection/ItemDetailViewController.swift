//
//  ItemDetailViewController.swift
//  Collection
//
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews(){
        guard let item = item else{
        title = "New Item"
            return
        }
        
        title = item.name
        nameField.text = item.name
        valueField.text = item.value
        locationField.text = item.location
        if item.isFavorite == true {
            heartField.text = "❤️"
            setFaveButton.setTitle("Remove As Favorite", for: UIControlState.normal)
            
        }

    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameField.text,
            let value = valueField.text,
            let location = locationField.text else {return}
        
        if let item = item {
            itemController?.update(item: item, withName: name, value: value, location: location)
        } else {
            itemController?.createNewItem(withName: name, value: value, location: location)
        }
        navigationController?.popViewController(animated: true)
    }

    @IBAction func setFavorite(_ sender: Any) {
        guard let name = nameField.text,
            let value = valueField.text,
            let location = locationField.text else {return}
        
        if let item = item {
            if(item.isFavorite==false){
                itemController?.update(item: item, withName: name, value: value, location: location, isFavorite: true)
            } else {
                itemController?.update(item: item, withName: name, value: value, location: location, isFavorite: false)
            }
        }
        
        
         navigationController?.popViewController(animated: true)
        
    }
    
    @IBOutlet weak var setFaveButton: UIButton!
    @IBOutlet weak var heartField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    var item: Item?
    var itemController: ItemController?

    
}
