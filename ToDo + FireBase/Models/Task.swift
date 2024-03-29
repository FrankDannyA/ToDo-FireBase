//
//  Task.swift
//  ToDo + FireBase
//
//  Created by Даниил Франк on 24.12.2021.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Task {
    let title: String
    let userID: String
    let ref: DatabaseReference?
    var completed: Bool = false
    
    init(title: String, userID: String) {
        self.title = title
        self.userID = userID
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot){
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        userID = snapshotValue["userID"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
    

}

