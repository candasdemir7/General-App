//
//  CurrencyVC.swift
//  MustafacanDasdemir_HW2
//
//  Created by Can Daşdemir on 28.10.2024.
//

import UIKit

class CurrencyVC: UIViewController {

    
    //label and txt
    
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var firstTxtField: UITextField!
    
    @IBOutlet weak var secondTxtField: UITextField!
    
    @IBOutlet weak var currencyImage: UIImageView!
        
    @IBOutlet weak var mSegmentedControl: UISegmentedControl!
    
    
    @IBAction func onSegmentedChange(_ sender: UISegmentedControl) {
        
        
        
        switch mSegmentedControl.selectedSegmentIndex {
        case 0:
        
            //görselleri eşitlemek için
            currencyImage.image = UIImage(named: "tl_usd")
            firstTxtField.text = ""
            secondTxtField.text = ""
            secondLabel.text = "USD (\u{0024}):"
            secondTxtField.placeholder = "Enter USD"
 
        case 1:
            firstTxtField.text = ""
            secondTxtField.text = ""
            secondLabel.text = "EUR (\u{20AC}):"
            secondTxtField.placeholder = "Enter EUR"
            currencyImage.image = UIImage(named: "tl_euro")
           
        case 2:
            firstTxtField.text = ""
            secondTxtField.text = ""
            secondLabel.text = "GBP (\u{00A3}):"
            secondTxtField.placeholder = "Enter GBP"
            currencyImage.image = UIImage(named: "tl_gbp")
          
  
           
        default:
            break
        }
    }
    
    
    @IBAction func onSingleTap(_ sender: UITapGestureRecognizer) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //single tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap))
        currencyImage.addGestureRecognizer(tapGesture)
        currencyImage.isUserInteractionEnabled = true
        
        
        firstLabel.text = "TL (\u{20BA}):"
        secondLabel.text = "USD (\u{0024}):"
        firstTxtField.text = ""
        secondTxtField.text = ""
        secondTxtField.placeholder = "Enter USD"
        currencyImage.image = UIImage(named: "tl_usd")
        
        
        firstTxtField.isUserInteractionEnabled = true
        secondTxtField.isUserInteractionEnabled = true

        
        
        
    }
    
    
    //önemli olan şey edit change edit begin ona iyi bak

        @IBAction func txtField1Action(_ sender: UITextField) {
        firstTxtField.text = ""
        print("can")
        secondTxtField.text = ""
    }
    
    @IBAction func txtField2Action(_ sender: UITextField) {
      firstTxtField.text = ""
        secondTxtField.text = ""
    }
    
    
    
    //Texfield değişkliklerinde
    
    @IBAction func txtField1Edit(_ sender: UITextField) {
        
        if let tl = Double(firstTxtField.text!) {
            
            switch mSegmentedControl.selectedSegmentIndex {
            case 0:
                secondTxtField.text = String(format: "%.2f", tl / 36.0) // for rounding off to 2 d.p.
                
            case 1:
                secondTxtField.text = String(format: "%.2f", tl / 33.0)
                
            case 2:
                secondTxtField.text = String(format: "%.2f", tl / 38.5)
                
            default:
                break
            }
        }
    }
    
    
    //txtField2 edit
    
    @IBAction func txtField2Edit(_ sender: UITextField) {
        
        if let otherCurrency = Double(secondTxtField.text!) {
            
            switch mSegmentedControl.selectedSegmentIndex {
            case 0:
                firstTxtField.text = String(format: "%.2f", otherCurrency * 36.0)
                
            case 1:
                firstTxtField.text = String(format: "%.2f", otherCurrency * 33.0)
                
            case 2:
                firstTxtField.text = String(format: "%.2f", otherCurrency * 38.5)
                
            default:
                break
            }
        }
    }
    
    
    
    
    //single tap
      var  currentImage: Int = 0
      @objc func handleImageTap() {
              // Cycle through the currency options
          currentImage = (currentImage + 1) % 3 // 0, 1, 2
              
              // Update UISegmentedControl selection
          mSegmentedControl.selectedSegmentIndex = currentImage
              
              // Optional: Update the UIImageView to reflect the current option visually
          updateImage(for: currentImage)
          }
      
      
      
      // Update the image based on the selected photo
          func updateImage(for index: Int) {
              switch index {
              case 0:
                  currencyImage.image = UIImage(named: "tl_usd")
                  firstTxtField.text = ""
                  secondTxtField.text = ""
                  secondLabel.text = "USD (\u{0024}):"
                  secondTxtField.placeholder = "Enter USD"
              case 1:
                  firstTxtField.text = ""
                  secondTxtField.text = ""
                  secondLabel.text = "EUR (\u{20AC}):"
                  secondTxtField.placeholder = "Enter EUR"
                  currencyImage.image = UIImage(named: "tl_euro")
              case 2:
                  firstTxtField.text = ""
                  secondTxtField.text = ""
                  secondLabel.text = "GBP (\u{00A3}):"
                  secondTxtField.placeholder = "Enter GBP"
                  currencyImage.image = UIImage(named: "tl_gbp")
              

              default:
                  break
              }
          }
      

    
    // To close the keyboard when white area is pressed
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
