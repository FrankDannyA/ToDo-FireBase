//
//  FolderViewController.swift
//  ToDo + FireBase
//
//  Created by Даниил Франк on 23.12.2021.
//

import UIKit
import Firebase

class FolderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
           
       return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func addTaped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}


