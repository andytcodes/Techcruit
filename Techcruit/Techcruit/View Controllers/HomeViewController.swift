//
//  HomeViewController.swift
//  Techcruit
//
//  Created by Andy Tran on 2021-04-08.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let user = Auth.auth().currentUser?.uid
        //print(user)
        
        //example: getting full user document
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.uid
        let userDbRef = db.collection("users").document(user!)
        
        userDbRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                print(document.data()?["lastname"]) // example: how to get data from user
            } else {
                print("Document does not exist")
            }
        }
        
        
        //can be used to update data or add new data
//        userDbRef.updateData([
//            "newdata": true
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//            }
//        }
        
        print(userDbRef)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
