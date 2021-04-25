//
//  UserProfileViewController.swift
//  Techcruit
//
//  Created by Joseph Du on 2021-04-20.
//  UI By Andy Tran
//

import UIKit
import Firebase
import WebKit

//User Profile View
class UserProfileViewController: UIViewController, WKNavigationDelegate {
    //All fields to display
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblSkill1: UILabel!
    @IBOutlet weak var lblSkill2: UILabel!
    @IBOutlet weak var lblSkill3: UILabel!
    @IBOutlet weak var sgLinks: UISegmentedControl!
    @IBOutlet weak var wkView: WKWebView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    
    var portfolio : String!
    var linkedin : String!
    var github : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Read and display user data
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.uid
        let userDbRef = db.collection("users").document(user!)
        
        userDbRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                
                self.lblFirstName.text = document.data()?["firstname"] as? String
                self.lblLastName.text = document.data()?["lastname"] as? String
                self.lblRole.text = document.data()?["role"] as? String
                self.lblSummary.text = document.data()?["summary"] as? String
                self.lblSkill1.text = document.data()?["skill1"] as? String
                self.lblSkill2.text = document.data()?["skill2"] as? String
                self.lblSkill3.text = document.data()?["skill3"] as? String
                self.portfolio = document.data()?["portfoliourl"] as? String
                self.github = document.data()?["githuburl"] as? String
                self.linkedin = document.data()?["linkedinurl"] as? String
                self.lblEmail.text = document.data()?["email"] as? String
                                
                let urlAddress = URL(string: self.portfolio)
                let url = URLRequest(url: urlAddress!)
                
                self.wkView.load(url)
                
            } else {
                print("Document does not exist")
            }
        }
    }
    
    //Listen to the segment change, and switch webkit view accordingly
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            let urlAddress = URL(string: portfolio)
            let url = URLRequest(url: urlAddress!)
            
            wkView.load(url)
        }
        else if sender.selectedSegmentIndex == 1 {
            let urlAddress = URL(string: linkedin)
            let url = URLRequest(url: urlAddress!)
            
            wkView.load(url)
        }
        else if sender.selectedSegmentIndex == 2{
            let urlAddress = URL(string: github)
            let url = URLRequest(url: urlAddress!)
            
            wkView.load(url)
        }
        
    }
    
    //Takes user back to Jobs page
    @IBAction func onBackClick(_ sender: Any) {
        transitionToJobs()
    }
    
    //Transitions to jobs
    func transitionToJobs(){
        //reference to homeviewcontroller
        let jobsViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.jobsViewController) as? JobListViewController
        view.window?.rootViewController = jobsViewController
        view.window?.makeKeyAndVisible()
    }
    
    //Take user to edit page
    @IBAction func onEditClick(_ sender: Any) {
        transitionToEdit()
    }
    
    //transition to edit page
    func transitionToEdit(){
        let editViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.editViewController) as? EditViewController
        view.window?.rootViewController = editViewController
        view.window?.makeKeyAndVisible()
    }
    
    //Logs out user and takes them back to signup/login page
    @IBAction func onLogoutClick(_ sender: Any) {
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
        transitionToHome()
       } catch let signOutError as NSError {
         print ("Error signing out: %@", signOutError)
       }
    }
    
    //transitions to main view 
    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UINavigationController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
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
