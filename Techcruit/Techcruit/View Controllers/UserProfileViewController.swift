//
//  UserProfileViewController.swift
//  Techcruit
//
//  Created by Joseph Du on 2021-04-20.
//

import UIKit
import FirebaseAuth
import Firebase

class UserProfileViewController: UIViewController {

    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userRoleLabel: UILabel!
    @IBOutlet weak var userSummaryLabel: UILabel!
    @IBOutlet weak var skill1Button: UIButton!
    @IBOutlet weak var skill2Button: UIButton!
    @IBOutlet weak var skill3Button: UIButton!
    
    //open the photo in library and display it in image view
    @IBAction func openPhotoLibraryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            var userPhotoImageView = UIImagePickerController()
            userPhotoImageView.delegate = self
            userPhotoImageView.sourceType = .photoLibrary;
            userPhotoImageView.allowsEditing = true
            self.presentViewController(userPhotoImageView, animated: true, completion: nil)
        }
    }
    
    func userPictureImageViewController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        userPhotoImageView.image = image
        dismiss(animated:true, completion: nil)
    }
    
    func renameSkillButton(){
        //get the skill name from firebase
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser?.uid
        let userDbRef = db.collection("users").document(user!)
        
        let skill1 = nil
        let skill2 = nil
        let skill3 = nil
        
        //reference the data
        userDbRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                print(document.data()?["lastname"])
                skill1 = document.data()?["skill1"]
                skill2 = document.data()?["skill2"]
                skill3 = document.data()?["skill3"]
            } else {
                print("Document does not exist")
            }
        }
        
        //rename the button name
        skill1Button.setTitle(skill1, for: .normal)
        skill2Button.setTitle(skill2, for: .normal)
        skill3Button.setTitle(skill3, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //rename the title of skill button
        renameSkillButton()
        
        //get the data of user from firebase
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser?.uid
        let userDbRef = db.collection("users").document(user!)
        
        let firstName = nil
        let lastName = nil
        let role = nil
        let summary = nil
        
        //reference the data
        userDbRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                print(document.data()?["lastname"])
                firstName = document.data()?["firstname"]
                lastName = document.data()?["lastname"]
                role = document.data()?["role"]
                summary = document.data()?["summary"]
            } else {
                print("Document does not exist")
            }
        }
        
        let name = firstName + lastName
        //set the value from firebase as label
        userNameLabel.text = name
        userRoleLabel.text = role
        userSummaryLabel.text = summary
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
