//
//  SignUpViewController.swift
//  Techcruit
//
//  Created by Andy Tran on 2021-04-08.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var imgBg: UIImageView!
    @IBOutlet weak var lblLogo: UILabel!
    @IBOutlet weak var lblLogoOp: UILabel!
    @IBOutlet weak var imgLaptop: UIImageView!
    @IBOutlet weak var imgLaptopOverlay: UIImageView!
    
    var lightAccent : CGColor = Utilities.lightAccentCG()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp(){
        lblError.alpha = 0
        Utilities.btnCornerRadiusBorderWidthBorderColor(btn: btnSignUp, r: 7, bw: 3, bc: lightAccent)
        
        //bg
        imgBg.layer.zPosition = -1
        imgBg.layer.cornerRadius = 20
        
        //logo
        lblLogo.layer.zPosition = -2
        
        //laptop
        imgLaptop.layer.zPosition = -4
        imgLaptopOverlay.layer.zPosition = -3
        
        //textfields
        Utilities.tfStyle(tf: tfFirstName)
        Utilities.tfStyle(tf: tfLastName)
        Utilities.tfStyle(tf: tfEmail)
        Utilities.tfStyle(tf: tfPassword)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        //Validate the fields
        let error = validateFields()
        if error != nil {
            //Show error msg
            showError(msg: error!)
        }
        else {
            
            //Create clean data
            let firstName = tfFirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = tfLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = tfEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = tfPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create user | result == uid
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                    
                //Check for errors
                if err != nil{
                    //Error creating a user
                    self.showError(msg: "Error creating user")
                }
                else{
                    //User was created successfully, store info
                    let db = Firestore.firestore()
                    
                    //stores user data info into user collection. DocumentID is set to UID
                    db.collection("users").document(result!.user.uid).setData(["firstname": firstName, "lastname": lastName, "email": email, "password": password, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil{
                            self.showError(msg: "Error saving user data")
                        }
                    }
                    
//                    let user = User(firstname: firstName, lastname: lastName, email: email, password: password, uid: result!.user.uid)
//
//                    do {
//                        try db.collection("users").document(result!.user.uid).setData(["" : user])
//                    } catch let error {
//                        print("Error writing user to Firestore: \(error)")
//                    }

                    
                    //Transition into home screen
                    self.transitionToProfileSetup()
                }
                
            }
        }
    }
    
    func transitionToProfileSetup(){
        //reference to homeviewcontroller
        let setUpViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.setUpViewController) as? SetUpViewController
        
        view.window?.rootViewController = setUpViewController
        view.window?.makeKeyAndVisible()
    }
    
    //show error message where there is one
    func showError(msg : String){
        lblError.text = msg
        lblError.alpha = 1
    }
    
    //Vlidates fields and checks if they're correct. If correct, return nil, otherwise, return error message
    func validateFields() -> String? {
        
        //Check if all fields are filled
        if tfFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields"
        }
        
        
        
        return nil
    }

}
