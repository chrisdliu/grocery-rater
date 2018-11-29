//
//  DatabaseHelper.swift
//  Grocery Rater
//
//  Created by Chris Liu on 11/28/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

import FirebaseDatabase

func getItem(producer: String, name: String, callback) {
    let ref = Database.database().reference()
    var data: [String:Any] = [:]
    ref.child("producers/\(producer)/\(name)").observeSingleEvent(of: .value, with: { snapshot in
        if snapshot.exists() {
            if let value = snapshot.value as? [String:Any] {
                data = value
                data["error"] = false
                return
            }
        }
        data["error"] = true
    })
}

func createItem(producer: String, name: String) -> Bool {
    let ref = Database.database().reference()
    let data: [String:Any] = [
        "price": 0,
        "quality": 0,
        "reviews": [],
    ]
    var success = true
    ref.child("producers/\(producer)/\(name)").updateChildValues(data) { error, ref in
        if error != nil {
            success = false
        }
    }
    
}

func setItem(data: [String:Any]) {
    let ref = Database.database().reference()
    
}
