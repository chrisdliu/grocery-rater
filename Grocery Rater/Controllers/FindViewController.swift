//
//  FindViewController.swift
//  Grocery Rater
//
//  Created by Catherine Hu on 11/14/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

class FindViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var groceryField: UITextField!
    @IBOutlet weak var producerField: UITextField!
    @IBOutlet weak var categories: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories.collectionViewLayout = CategoryLayout.init()
        categories.delegate = self
        categories.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categories.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCell
        cell.categoryLabel.text = "yeet"
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func search(_ sender: Any) {
    }
}
