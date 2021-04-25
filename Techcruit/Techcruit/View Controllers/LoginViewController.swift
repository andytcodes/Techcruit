//
//  LoginViewController.swift
//  Techcruit
//
//  Created by Andy Tran on 2021-04-08.
//

import UIKit
import FirebaseAuth

//Login view
class LoginViewController: UIViewController {

    //All fields for log in
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var lblError: UILabel!
    
    @IBOutlet weak var imgBg: UIImageView!
    @IBOutlet weak var imgLaptop: UIImageView!
    
    @IBOutlet weak var imgLaptopOverlaye: UIImageView!
    @IBOutlet weak var lblLogo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    //UI styling function
    func setUp(){
        lblError.alpha = 0
        Utilities.btnCornerRadiusBorderWidthBorderColor(btn: btnLogin, r: 7, bw: 3, bc: Utilities.lightAccentCG())
        
        //zpositions
        imgBg.layer.zPosition = -1
        imgBg.layer.cornerRadius = 20
        lblLogo.layer.zPosition = -2
        imgLaptopOverlaye.layer.zPosition = -3
        imgLaptop.layer.zPosition = -4
        
        //textfield style
        Utilities.tfStyle(tf: tfEmail)
        Utilities.tfStyle(tf: tfPassword)
    }

    //Upon login button click, authorize and transition
    @IBAction func loginTapped(_ sender: Any) {
        
        //Validate text fields
        let error = validateFields()
        if error != nil {
            //Show error msg
            showError(msg: error!)
        }
        else{
            //Create clean text fields
            let email = tfEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = tfPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Sign in user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    //Could not sign in
                    self.lblError.text = "Could not sign in."
                    self.lblError.alpha = 1
                }
                else {
                    self.transitionToJobs()
                }
                
            }
        }
    }
    
    //transition to jobs page
    func transitionToJobs(){
        //reference to homeviewcontroller
        let jobsViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.jobsViewController) as? JobListViewController
        
        view.window?.rootViewController = jobsViewController
        view.window?.makeKeyAndVisible()
    }
    
    //show error message where there is one
    func showError(msg : String){
        lblError.text = msg
        lblError.alpha = 1
    }
    
    func validateFields() -> String? {
        
        //Check if all fields are filled
        if tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields"
        }
        return nil
    }
    

}
