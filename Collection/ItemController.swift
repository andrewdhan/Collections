//
//  ItemController.swift
//  Collection
//
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

class ItemController {
    private(set) var items = [Item]()
    
    
    func createNewItem(withName name: String, value: String, location: String) -> Item{
        let newItem = Item(name: name, value: value, location: location, isFavorite:false)
        items.append(newItem)
        return newItem
    }
    
    func update(item:Item, withName name: String, value: String, location: String, isFavorite:Bool = false){
        //get index
        guard let index =  items.index(of: item) else {return}
        
        //gets item and edits information
        var temp = item
        temp.name = name
        temp.value = value
        temp.location = location
        
        //deletes item with old values from array
        items.remove(at: index)
        
        if temp.isFavorite != isFavorite {
            if isFavorite == true{
                temp.isFavorite = true
                items.insert(temp, at: 0)
            } else {
                temp.isFavorite = false
                items.insert(temp, at: items.count)
            }
        } else{
        //inserts item with new values to array
        items.insert(temp, at: index)
        }
        
    }
    
}
