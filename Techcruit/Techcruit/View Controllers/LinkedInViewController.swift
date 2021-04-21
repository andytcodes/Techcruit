//
//  LinkedInViewController.swift
//  Techcruit
//
//  Created by Joseph Du on 2021-04-20.
//

import UIKit
import FirebaseAuth
import Firebase

class LinkedInViewController: UIViewController {

    @IBOutlet weak var LinkedInWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //call the firebase
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser?.uid
        let linkedInUrl = nil
        
        //reference the firebase
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user linked in url
            let value = snapshot.value as? NSDictionary
            linkedInUrl = value?["linkedinurl"] as? String ?? ""
            let user = User(linkedInUrl: linkedInUrl)
            }) { (error) in
                print(error.localizedDescription)
        }
        
        //display the view
        let urlAddress = URL(string: linkedInUrl)
        let url = URLRequest(url: urlAddress!)
        wbPage?.loadRequest(url as URLRequest)
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
