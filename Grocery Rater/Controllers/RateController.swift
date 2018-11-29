//
//  RateController.swift
//  Grocery Rater
//
//  Created by Chris Liu on 11/14/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

import FirebaseDatabase

class RateController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var producerField: UITextField!
    @IBOutlet weak var price1: UIButton!
    @IBOutlet weak var price2: UIButton!
    @IBOutlet weak var price3: UIButton!
    @IBOutlet weak var price4: UIButton!
    @IBOutlet weak var price5: UIButton!
    @IBOutlet weak var quality1: UIButton!
    @IBOutlet weak var quality2: UIButton!
    @IBOutlet weak var quality3: UIButton!
    @IBOutlet weak var quality4: UIButton!
    @IBOutlet weak var quality5: UIButton!
    @IBOutlet weak var commentField: UITextView!
    
    var priceStars: [UIButton]?
    var qualityStars: [UIButton]?
    
    var price = 0
    var quality = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        priceStars = [price1, price2, price3, price4, price5]
        qualityStars = [quality1, quality2, quality3, quality4, quality5]
        
        let color = CGFloat(225.0 / 255.0)
        commentField.layer.borderColor = UIColor(red: color, green: color, blue: color, alpha: 1.0).cgColor
        commentField.layer.borderWidth = 1.0
        commentField.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectPrice(_ sender: Any) {
        guard let _ = priceStars else { return }
        guard let button = sender as? UIButton else { return }
        if button == price1 {
            setPrice(stars: 1)
        } else if button == price2 {
            setPrice(stars: 2)
        } else if button == price3 {
            setPrice(stars: 3)
        } else if button == price4 {
            setPrice(stars: 4)
        } else if button == price5 {
            setPrice(stars: 5)
        }
    }
    
    func setPrice(stars: Int) {
        price = stars
        for i in 0..<stars {
            priceStars![i].setImage(#imageLiteral(resourceName: "gold_star"), for: .normal)
        }
        for i in stars..<5 {
            priceStars![i].setImage(#imageLiteral(resourceName: "gray_star"), for: .normal)
        }
    }
    
    @IBAction func selectQuality(_ sender: Any) {
        guard let _ = qualityStars else { return }
        guard let button = sender as? UIButton else { return }
        if button == quality1 {
            setQuality(stars: 1)
        } else if button == quality2 {
            setQuality(stars: 2)
        } else if button == quality3 {
            setQuality(stars: 3)
        } else if button == quality4 {
            setQuality(stars: 4)
        } else if button == quality5 {
            setQuality(stars: 5)
        }
    }
    
    func setQuality(stars: Int) {
        quality = stars
        for i in 0..<stars {
            qualityStars![i].setImage(#imageLiteral(resourceName: "gold_star"), for: .normal)
        }
        for i in stars..<5 {
            qualityStars![i].setImage(#imageLiteral(resourceName: "gray_star"), for: .normal)
        }
    }
    
    @IBAction func post(_ sender: Any) {
        guard let name = nameField.text else { return }
        guard let producer = producerField.text else { return }
        if price == 0 || quality == 0 { return }
        let comment = commentField.text ?? ""
        
        let postData: [String:Any] = [
            "price": price,
            "quality": quality,
            "comment": comment
        ]
        
        getItem(producer: producer, name: name, callback: { data in
            var updated: [String:Any] = [:]
            var reviews = data["reviews"] as! [[String:Any]]
            reviews.append(postData)
            
            var itemPrice = 0.0
            var itemQuality = 0.0
            for review in reviews {
                itemPrice += Double(review["price"] as! Int)
                itemQuality += Double(review["quality"] as! Int)
            }
            
            updated["price"] = itemPrice / Double(reviews.count)
            updated["quality"] = itemQuality / Double(reviews.count)
            updated["reviews"] = reviews
            
            setItem(producer: producer, name: name, data: updated, callback: { error, ref in
                if error != nil {
                    self.alertFail()
                } else {
                    self.alertSuccess()
                }
            })
        })
    }
    
    func alertFail() {
        let alert = UIAlertController(title: "Failure", message: "Failed to post rating!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func alertSuccess() {
        let alert = UIAlertController(title: "Success", message: "Posted rating!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "exitRate", sender: nil)
        }))
        present(alert, animated: true)
    }
}
