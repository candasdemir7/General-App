//
//  AboutVC.swift
//  MustafacanDasdemir_HW2
//
//  Created by Can Daşdemir on 28.10.2024.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var middle: UILabel!
    @IBOutlet weak var header: UILabel!
    
    
    // Optional variables to receive data from StartVC through segue
    var topText: String!
    var centerText: String!
    var centerLabelColor: UIColor!
    var centerLabelStyle: UIFont!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let headerLabel = topText {
            header.text = headerLabel
        }
        if let middleLabelText = centerText {
            middle.text = middleLabelText
        }
        if let color = centerLabelColor {
            middle.textColor = color
        }
        if let style = centerLabelStyle {
            middle.font = style
        }
        // Do any additional setup after loading the view.
    }
    

  

}
