//
//  SetUpViewController.swift
//  Techcruit
//
//  Created by Andy Tran on 2021-04-19.
//

import UIKit
import Firebase

class SetUpViewController: UIViewController {

    @IBOutlet var imgBg : UIImageView!
    @IBOutlet weak var lblLogoClear: UILabel!
    @IBOutlet weak var imgLaptop: UIImageView!
    @IBOutlet weak var lblLogo: UILabel!
    @IBOutlet weak var imgOverlay: UIImageView!
    @IBOutlet weak var tfRole: UITextField!
    @IBOutlet weak var tfSummary: UITextField!
    @IBOutlet weak var tfSkill1: UITextField!
    @IBOutlet weak var tfSkill2: UITextField!
    @IBOutlet weak var tfSkill3: UITextField!
    @IBOutlet weak var tfPortfolioURL: UITextField!
    @IBOutlet weak var tfLinkedInURL: UITextField!
    @IBOutlet weak var tfGithubURL: UITextField!
    @IBOutlet weak var btnSetUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp(){
        //bg
        imgBg.layer.cornerRadius = 20
        
        Utilities.btnCornerRadiusBorderWidthBorderColor(btn: btnSetUp, r: 7, bw: 3, bc: Utilities.lightAccentCG())
        
        Utilities.tfStyle(tf: tfRole)
        Utilities.tfStyle(tf: tfSummary)
        Utilities.tfStyle(tf: tfSkill1)
        Utilities.tfStyle(tf: tfSkill2)
        Utilities.tfStyle(tf: tfSkill3)
        Utilities.tfStyle(tf: tfPortfolioURL)
        Utilities.tfStyle(tf: tfLinkedInURL)
        Utilities.tfStyle(tf: tfGithubURL)
    }
    
    //example of updating user data. If field does not already exist, it will add the field
    @IBAction func OnClickSetUp(_ sender: Any) {
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
                self.transitionToHome()
            }
        }
    }
    
    func transitionToHome(){
        //reference to homeviewcontroller
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
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
