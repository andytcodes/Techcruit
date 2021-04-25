//
//  JobPostingViewController.swift
//  GroupProject
//
//  Created by Kanghyun Kim
//  Student Number 991542281
//  ViewController for the page showing the Job List.
//

import UIKit

class JobPostingViewController: UIViewController {
    
    @IBOutlet var lbTitle : UILabel!
    @IBOutlet var lbCoName : UILabel!
    @IBOutlet var lbCoLoc : UILabel!
    @IBOutlet var lbCoPhone : UILabel!
    @IBOutlet var lbJobSalary : UILabel!
    @IBOutlet var lbJobDesc : UILabel!
    
    let job = Job()
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func displayInfo(){
        let sId = Int(mainDelegate.selectedId) - 1
        let disTitle = job.jobTitle[sId]
        let disCoName = job.coName[sId]
        let disCoLoc = job.coLocation[sId]
        let disCoPhone = job.coPhone[sId]
        let disJobSalary = job.jobSalary[sId]
        let disJobDesc = job.jobDesc
        
        lbTitle.text = disTitle
        lbCoName.text = disCoName
        lbCoLoc.text = disCoLoc
        lbCoPhone.text = disCoPhone
        lbJobSalary.text = disJobSalary
        lbJobDesc.text = disJobDesc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lbJobDesc.numberOfLines = 0
        displayInfo()
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
