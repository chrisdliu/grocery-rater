//
//  LoginViewController.swift
//  Grocery Rater
//
//  Created by Chris Liu on 11/14/18.
//  Copyright © 2018 cathris. All rights reserved.
//

import UIKit
import FirebaseAuth


class LogInViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "loginToMain", sender: nil)
        }
    }
    
    @IBAction func login(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        if email == "" || password == "" {
            let alertController = UIAlertController(title: "Log In Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "loginToMain", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Log In Error", message:
                        error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func signup(_ sender: Any) {
        performSegue(withIdentifier: "loginToSignup", sender: nil)
    }
}

