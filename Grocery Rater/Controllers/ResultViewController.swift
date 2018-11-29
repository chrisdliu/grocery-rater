//
//  SearchViewController.swift
//  Grocery Rater
//
//  Created by Catherine Hu on 11/28/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    var results: [[String:Any]] = []
    var queryName = ""
    var queryProducer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("requerying")
        results = []
        table.reloadData()
        query(queryProducer: queryProducer, queryName: queryName, callback: { data in
            self.results = data
            print(data)
            self.table.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "result") as! ResultCell
        let result = results[indexPath.item]
        cell.producerLabel.text = result["producer"] as? String
        cell.nameLabel.text = result["name"] as? String
        cell.setPrice(stars: Int(result["price"] as! Double + 0.5))
        cell.setQuality(stars: Int(result["quality"] as! Double + 0.5))
        return cell
    }
}
