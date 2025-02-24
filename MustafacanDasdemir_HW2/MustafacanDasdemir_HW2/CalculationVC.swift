//
//  CalculationVC.swift
//  MustafacanDasdemir_HW2
//
//  Created by Can Daşdemir on 28.10.2024.
//

import UIKit




class CalculationVC: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource, InputVCDelegate
{
    
    
    //DELEGATE İŞLEMİNDE SADECE İNPUT PARAMETERSDAN İŞLEM SONUCUNU ALACAĞIZ
    func didEnterParameters(data: (Double,Double,String)) {
        
        print("Delegate called with data: \(data)") // Kontrol amaçlı
        
        
        let (area, perimeter, item_name) = data
        // Sonucu bir uyarı olarak göster
        
        let alert = UIAlertController(
            title: "Result",
            message: "\(item_name)\nArea = \(area)\nPerimeter = \(perimeter)",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
        
//        let alertController = UIAlertController(
//            title: "\(item_name) Hesaplama",
//            message: String(format: "Alan: %.2f \nÇevre: %.2f", area, perimeter),
//            preferredStyle: .alert
//        )
//        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
//        self.present(alertController, animated: true, completion: nil)
        
        print("Delegate called with data: \(data)") // Kontrol amaçlı

    }
    
    
  

   

    
    //hesaplamalr
    

            

    override func viewDidLoad() {
        super.viewDidLoad()
        print("CalculationVC loaded") // Kontrol amaçlı

        
        pickerView.delegate = self
        pickerView.dataSource = self
//        updateShapeImage(for: selectedShape)


        // Do any additional setup after loading the view.
    }
    
    
    //etiketler
    
    @IBOutlet weak var mShapeImage: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    //pickerview için gerekli olanlar
    
    var shapes = ["triangle", "circle", "rectangle"]
//    var selectedShape: String = "Triangle" // Default shape
    var shape_item_name: String = ""


    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of items/rows in the components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shapes.count
    }
    
    // Called automatically multiple times. To attach the data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return shapes[row]
    }
    
    // Called when an item in pickerView is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        shape_item_name = shapes[row]
        switch row {
        case 0:
            mShapeImage.image = UIImage(named: "triangle") // Dikdörtgen görseli
            shape_item_name = shapes[row]

        case 1:
            mShapeImage.image = UIImage(named: "circle") // Daire görseli
            shape_item_name = shapes[row]

        case 2:
            mShapeImage.image = UIImage(named: "rectangle") // Üçgen görseli
            shape_item_name = shapes[row]

        default:
            mShapeImage.image = UIImage(named: "triangle") // Dikdörtgen görseli
            shape_item_name = shapes[row]

        }
        
            // selectedShape = shapes[row].capitalized // Capitalize the shape name
             //   updateShapeImage(for: selectedShape)
        
    }
    
    

    //For unwind segue
    
//    
//    @IBAction func inputParametersButton(_ sender: UIButton) {
//        performSegue(withIdentifier: "input", sender: self)
//
//    }
    
    
    //for segue to input parameters
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "input" {
            let vc = segue.destination as! InputVC
            vc.title_for_input = shape_item_name
            vc.delegate = self
     
//            vc.tit = selectedShape.lowercased() // Pass the selected shape to InputVC

        }
    }

}

