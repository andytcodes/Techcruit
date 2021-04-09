//
//  ViewController.swift
//  Techcruit
//
//  Created by Andy Tran on 2021-04-08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var imgBtmBG: UIImageView!
    
    @IBOutlet weak var lblLogo: UILabel!
    @IBOutlet weak var lblLogoOp: UILabel!
    
    @IBOutlet weak var imgLaptop: UIImageView!
    @IBOutlet weak var imgLaptopOverlay: UIImageView!
    @IBOutlet weak var imgUndraw: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp(){
        //bottom bg
        imgBtmBG.layer.zPosition = -1
        imgBtmBG.layer.cornerRadius = 20
        
        //sign up
        Utilities.btnCornerRadiusBorderWidthBorderColor(btn: btnSignUp, r: 7, bw: 3, bc: Utilities.mainColorCG())
        
        //login
        btnLogin.layer.cornerRadius = 7
        
        //logo
        lblLogo.layer.zPosition = -2
        
        //laptop
        imgLaptop.layer.zPosition = -5
        
        //laptop overlay
        imgLaptopOverlay.layer.zPosition = -4
        
        //undraw
        imgUndraw.layer.zPosition = -3
    }

    @IBAction func unwindToMain(sender : UIStoryboardSegue){
        
    }

}

