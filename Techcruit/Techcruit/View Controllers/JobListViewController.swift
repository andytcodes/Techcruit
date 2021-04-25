//
//  JobListViewController.swift
//  GroupProject
//
//  Created by Kanghyun Kim
//  Student Number 991542281
//  ViewController for the page showing the Job List.
//

import UIKit

class JobListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Code for back button.
    @IBAction func unwindToJobListViewCongroller(sender : UIStoryboardSegue)
    {
        
    }
    
    // Bring Job class
    let job = Job()
        
    // How many cells in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return job.jobTitle.count
    }
    
    // How thick is the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    // How does the cell look like
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Using CellForJobList.swift
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CellForJobList ?? CellForJobList(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        tableCell.jobListTitleLable.text = job.jobTitle[rowNum]
        tableCell.jobListCoLabel.text = job.coName[rowNum]
        tableCell.jobListLocLabel.text = job.coLocation[rowNum]
        
        tableCell.accessoryType = .disclosureIndicator
                
        return tableCell
    }
      
    // How does the cell behave when clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Getting clicked information for displaying
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        mainDelegate.selectedId = job.jobId[indexPath.row]
        
        performSegue(withIdentifier: "JobListSegueToView", sender: nil)
    }
    
    @IBAction func onUserClick(_ sender: Any) {
        transitionToUser()
    }
    
    func transitionToUser(){
        //reference to homeviewcontroller
        let userViewControlelr = storyboard?.instantiateViewController(identifier: Constants.Storyboard.userViewController) as? UserProfileViewController
        view.window?.rootViewController = userViewControlelr
        view.window?.makeKeyAndVisible()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
