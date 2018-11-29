//
//  MainpageViewController.swift
//  Grocery Rater
//
//  Created by Chris Liu on 11/7/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit

class MainpageViewController: UIViewController {
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchButton.layer.cornerRadius = 5
        rateButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func search(_ sender: Any) {
        performSegue(withIdentifier: "mainToFind", sender: nil)
    }

    @IBAction func rate(_ sender: Any) {
        performSegue(withIdentifier: "mainToRate", sender: nil)
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) { }
}
