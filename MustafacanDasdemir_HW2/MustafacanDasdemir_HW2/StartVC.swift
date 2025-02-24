//
//  ViewController.swift
//  MustafacanDasdemir_HW2
//
//  Created by Can Daşdemir on 28.10.2024.
//

import UIKit

class StartVC: UIViewController {

    @IBOutlet weak var mSegmentedControl: UISegmentedControl!
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var mImage: UIImageView!
    
    
    
    
    //segmented change
    @IBAction func onSegmentedChanged(_ sender: UISegmentedControl) {
        
        
        switch mSegmentedControl.selectedSegmentIndex {  // switch sender.selectedSegmentIndex
        case 0:
            text.text = "Long Press Image to Open Calculation Controller"
            //görselleri eşitlemek için
            mImage.image = UIImage(named: "calculation")


          
        case 1:
            text.text = "Long Press Image to Open Currency Controller"
            mImage.image = UIImage(named: "currency")
           
        case 2:
            text.text = "Long Press Image to Player Player Controller"
            mImage.image = UIImage(named: "player")
          
        case 3:
            text.text = "Long Press Image to About About Controller"
            mImage.image = UIImage(named: "about")
           
        default:
            break
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//       Long press gesture recognizer'ı ayarlama
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        mImage.addGestureRecognizer(longPressRecognizer)
        mImage.isUserInteractionEnabled = true
        
        
        //Single tap gesture tek bir taneye basınca fotoğraf değişmesi
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap))
        mImage.addGestureRecognizer(tapGesture)
        mImage.isUserInteractionEnabled = true
    }
    
    
    
    
  //single tap
    var  currentImage: Int = 0
    @objc func handleImageTap() {
            // Cycle through the currency options
        currentImage = (currentImage + 1) % 4 // 0, 1, 2 or 3
            
            // Update UISegmentedControl selection
        mSegmentedControl.selectedSegmentIndex = currentImage
            
            // Optional: Update the UIImageView to reflect the current option visually
        updateImage(for: currentImage)
        }
    
    
    
    // Update the image based on the selected photo
        func updateImage(for index: Int) {
            switch index {
            case 0:
                mImage.image = UIImage(named: "calculation")
            case 1:
                mImage.image = UIImage(named: "currency")
            case 2:
                mImage.image = UIImage(named: "player")
                
            case 3:
                mImage.image = UIImage(named: "about")

            default:
                break
            }
        }
    
 //long press
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
            // Sadece "Calculation" segmenti seçildiğinde çalışır
        
      
//burada bu kodu yazmasan alttan üste geçiş sağlanmaz burası önemli
        if gestureRecognizer.state == .began && mSegmentedControl.selectedSegmentIndex == 0 {
                // Storyboard ID ile CalculationVC'ye geçiş yap
                
//            if let calculationVC = storyboard?.instantiateViewController(withIdentifier: "CalculationVC") as? CalculationVC {
//                    calculationVC.modalPresentationStyle = .pageSheet // Alttan kayarak açılacak
//                               calculationVC.modalTransitionStyle = .coverVertical // Dikey geçiş animasyonu
//                               present(calculationVC, animated: true, completion: nil)
            
            performSegue(withIdentifier: "toCalculation", sender: self)
  
                
            }
        
        
        
        //1.section
        
        if gestureRecognizer.state == .began && mSegmentedControl.selectedSegmentIndex == 1 {
                // Storyboard ID ile Currency'ye geçiş yap
                
//            if let currencyVC = storyboard?.instantiateViewController(withIdentifier: "CurrencyVC") as? CurrencyVC {
//                currencyVC.modalPresentationStyle = .fullScreen // Alttan kayarak açılacak
//             //  currencyVC.modalTransitionStyle = .coverVertical // Dikey geçiş animasyonu
//                present(currencyVC, animated: true, completion: nil)
//  
//                }
            
            performSegue(withIdentifier: "toCurrencyVC", sender: self)
            
            }

        if gestureRecognizer.state == .began && mSegmentedControl.selectedSegmentIndex == 2{
            
            
            performSegue(withIdentifier: "toPlayerVC", sender: self)
            
            
            
        }
        
        //3.section
        
        if gestureRecognizer.state == .began && mSegmentedControl.selectedSegmentIndex == 3 {
                // Storyboard ID ile AboutVC'ye geçiş yap
                
//            if let aboutVC = storyboard?.instantiateViewController(withIdentifier: "AboutVC") as? AboutVC {
//                aboutVC.modalPresentationStyle = .pageSheet // Alttan kayarak açılacak
//                aboutVC.modalTransitionStyle = .coverVertical // Dikey geçiş animasyonu
//                present(aboutVC, animated: true, completion: nil)
//  
//                }
            
            performSegue(withIdentifier: "toAboutVC", sender: self)

            }
        
        
        
        }
    
   
    //BURASI SEGUE DE DEĞİŞİKLİKYAPMAK İÇİN
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      
        // For AboutVC
        if segue.identifier == "toAboutVC" {
            if let aboutVC = segue.destination as? AboutVC {
                aboutVC.topText = "About Controller"
                aboutVC.centerText = "CTIS 480: Homework I"
                aboutVC.centerLabelColor = #colorLiteral(red: 0.4492385787, green: 0.09251748368, blue: 0.2881507218, alpha: 1)
                aboutVC.centerLabelStyle = UIFont.boldSystemFont(ofSize: 24)
            }
        }
    }
    
    
    
    
    //unwind segue kodu
    @IBAction func unwindToStartVC(segue: UIStoryboardSegue) {
           // Burada gerekirse herhangi bir işlemi yapabilirsin
       }
   
}

