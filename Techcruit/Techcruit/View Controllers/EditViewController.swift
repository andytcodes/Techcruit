//
//  EditViewController.swift
//  Techcruit
//
//  Created by Andy Tran on 2021-04-21.
//

import UIKit
import Firebase

//Edit View: User can edit their data
class EditViewController: UIViewController {
    //All fields to edit
    @IBOutlet weak var tfRole: UITextField!
    @IBOutlet weak var tfSummary: UITextField!
    @IBOutlet weak var tfSkill1: UITextField!
    @IBOutlet weak var tfSkill2: UITextField!
    @IBOutlet weak var tfSkill3: UITextField!
    @IBOutlet weak var tfPortfolioURL: UITextField!
    @IBOutlet weak var tfLinkedInURL: UITextField!
    @IBOutlet weak var tfGithubURL: UITextField!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var imgBg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Load user data and set all text fields to current data
        setUp()
        
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.uid
        let userDbRef = db.collection("users").document(user!)
        
        userDbRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                
                self.tfRole.text = document.data()?["role"] as? String
                self.tfSummary.text = document.data()?["summary"] as? String
                self.tfSkill1.text = document.data()?["skill1"] as? String
                self.tfSkill2.text = document.data()?["skill2"] as? String
                self.tfSkill3.text = document.data()?["skill3"] as? String
                self.tfPortfolioURL.text = document.data()?["portfoliourl"] as? String
                self.tfLinkedInURL.text = document.data()?["linkedinurl"] as? String
                self.tfGithubURL.text = document.data()?["githuburl"] as? String
                
            } else {
                print("Document does not exist")
            }
        }
        
    }
    
    //UI Setup
    func setUp(){
        imgBg.layer.cornerRadius = 20
        
        Utilities.btnCornerRadiusBorderWidthBorderColor(btn: btnEdit, r: 7, bw: 3, bc: Utilities.lightAccentCG())
        
        Utilities.tfStyle(tf: tfRole)
        Utilities.tfStyle(tf: tfSummary)
        Utilities.tfStyle(tf: tfSkill1)
        Utilities.tfStyle(tf: tfSkill2)
        Utilities.tfStyle(tf: tfSkill3)
        Utilities.tfStyle(tf: tfPortfolioURL)
        Utilities.tfStyle(tf: tfLinkedInURL)
        Utilities.tfStyle(tf: tfGithubURL)
    }
    
    //Sets user data upon Edit button click
    @IBAction func onClickEdit(_ sender: Any) {
        
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.uid
        let userDbRef = db.collection("users").document(user!)
        userDbRef.updateData([
            "role": tfRole.text,
            "summary": tfSummary.text,
            "skill1": tfSkill1.text,
            "skill2": tfSkill2.text,
            "skill3": tfSkill3.text,
            "portfoliourl": tfPortfolioURL.text,
            "linkedinurl": tfLinkedInURL.text,
            "githuburl": tfGithubURL.text
            
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
                self.transitionToUser()
            }
        }
        
    }
    
    //transitions user back to user page
    func transitionToUser(){
        //reference to homeviewcontroller
        let userViewControlelr = storyboard?.instantiateViewController(identifier: Constants.Storyboard.userViewController) as? UserProfileViewController
        view.window?.rootViewController = userViewControlelr
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
