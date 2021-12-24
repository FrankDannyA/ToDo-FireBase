//
//  ViewController.swift
//  ToDo + FireBase
//
//  Created by Даниил Франк on 23.12.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let segueIdentifier = "TaskSegue"

    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var registerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.alpha = 0
        
        Auth.auth().addStateDidChangeListener {[weak self] (auth, user) in
            if user != nil{
                self?.performSegue(withIdentifier: (self?.segueIdentifier)!, sender: nil)
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        loginTextField.text = ""
        registerTextField.text = ""
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        guard let email = loginTextField.text, let password = registerTextField.text , email != "" , password != "" else {
        displayWarningLabel(withText: "Info is incorrect")
        return
        }
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] (user, error) in
            if error != nil {
                self?.displayWarningLabel(withText: "Error ocured")
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: (self?.segueIdentifier)!, sender: nil)
                return
            }
            self?.displayWarningLabel(withText: "No such user")
        }
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let email = loginTextField.text, let password = registerTextField.text , email != "" , password != "" else {
        displayWarningLabel(withText: "Info is incorrect")
        return
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
            if error == nil {
                if user != nil {
                    //self?.performSegue(withIdentifier: "TaskSegue", sender: nil)
                } else {
                    print("user is not created")
                }
            } else {
                print(error!.localizedDescription)
            }
        })
    }

    
//MARK: - Methods
    
    func displayWarningLabel(withText text: String) {
        warningLabel.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseOut, animations: { [weak self] in
            self?.warningLabel.alpha = 1
        }, completion: {[weak self] compelte in
            self?.warningLabel.alpha = 0
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

