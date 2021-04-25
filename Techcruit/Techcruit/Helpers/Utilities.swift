//
//  Utilities.swift
//  Techcruit
//
//  Created by Andy Tran on 2021-04-08.
//

import Foundation
import UIKit

//Class for all universal styles
class Utilities {
    
    //Main Colors (CGColor)
    
    static func lightShadeCG() -> CGColor{
        return CGColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1)
    }
    static func lightAccentCG() -> CGColor{
        return CGColor(red: 91/255, green: 92/255, blue: 98/255, alpha: 1)
    }
    static func mainColorCG() -> CGColor{
        return CGColor(red: 223/255, green: 197/255, blue: 112/255, alpha: 1)
    }
    static func darkShadesCG() -> CGColor{
        return CGColor(red: 33/255, green: 32/255, blue: 52/255, alpha: 1)
    }
    
    //Button set ups
    //button with corner radius, border width and color
    static func btnCornerRadiusBorderWidthBorderColor(btn : UIButton, r : CGFloat, bw : CGFloat, bc : CGColor){
        btn.layer.cornerRadius = r
        btn.layer.borderWidth = bw
        btn.layer.borderColor = bc
    }
    
    //TextField style
    static func tfStyle(tf : UITextField){
        
        let btmLine = CALayer()
        btmLine.frame = CGRect(x: 0, y: tf.frame.height - 2, width: tf.frame.width, height: 2)
        btmLine.backgroundColor = Utilities.darkShadesCG()
        
        //remove border and add
        tf.borderStyle = .none
        tf.layer.addSublayer(btmLine)
        
    }
    
    
}
