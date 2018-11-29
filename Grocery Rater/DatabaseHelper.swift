//
//  DatabaseHelper.swift
//  Grocery Rater
//
//  Created by Chris Liu on 11/28/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

import FirebaseDatabase

func getItem(producer: String, name: String, callback: @escaping (_ data: [String:Any]) -> () ) {
    let ref = Database.database().reference()
    var data: [String:Any] = [:]
    ref.child("producers/\(producer)/\(name)").observeSingleEvent(of: .value, with: { snapshot in
        if snapshot.exists() {
            if let value = snapshot.value as? [String:Any] {
                data = value
                callback(data)
            }
        } else {
            let data: [String:Any] = [
                "producer": producer,
                "name": name,
                "price": 0.0,
                "quality": 0.0,
                "reviews": [],
                ]
            ref.child("producers/\(producer)/\(name)").updateChildValues(data) { error, ref in
                if error == nil {
                    callback(data)
                }
            }
        }
    })
}

func setItem(producer: String, name: String, data: [String:Any], callback: @escaping (_ error: Error?, _ ref: DatabaseReference) -> ()) {
    let ref = Database.database().reference()
    ref.child("producers/\(producer)/\(name)").updateChildValues(data, withCompletionBlock: callback)
}

func query(queryProducer: String, queryName: String, callback: @escaping (_ data: [[String:Any]]) -> ()) {
    
    let ref = Database.database().reference()
    ref.child("producers").observeSingleEvent(of: .value, with: { snapshot in
        var data: [[String:Any]] = []
        if snapshot.exists() {
            if let value = snapshot.value as? [String:Any] {
                
                //filtering
                for (producer, products) in value {
                    if (producer.range(of: queryProducer) != nil) {
                        for (product, productInfo) in products as! [String:Any] {
                            if (product.range(of: queryName) != nil) {
                                data.append(productInfo as! [String:Any])
                            }
                        }
                        
                    }
                }
                
            }
        }
        callback(data)
    })
}
