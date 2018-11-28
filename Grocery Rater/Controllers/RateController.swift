//
//  RateController.swift
//  Grocery Rater
//
//  Created by Chris Liu on 11/14/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        priceStars = [price1, price2, price3, price4, price5]
        let color = CGFloat(225.0 / 255.0)
        commentField.layer.borderColor = UIColor(red: color, green: color, blue: color, alpha: 1.0).cgColor
        commentField.layer.borderWidth = 1.0
        commentField.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
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
        print(stars)
        for i in 0..<stars {
            priceStars![i].setImage(#imageLiteral(resourceName: "gold_star"), for: .normal)
        }
        for i in stars..<5 {
            priceStars![i].setImage(#imageLiteral(resourceName: "gray_star"), for: .normal)
        }
    }
}
