//
//  InputVC.swift
//  MustafacanDasdemir_HW2
//
//  Created by Can Daşdemir on 28.10.2024.
//

import UIKit


//DELEGATE İÇİN PROTOCOL
//protocol AddControllerDelegate {
//    func addControllerDidFinish(controller: InputVC, text: (String, String))
//}




// Delegate protocol to pass data back
protocol InputVCDelegate: AnyObject {
    func didEnterParameters(data: (Double, Double, String))
}




class InputVC: UIViewController {

    
    //labellar
    @IBOutlet weak var widthLabel: UILabel!
  
    @IBOutlet weak var lengthLabel: UILabel!
    
    @IBOutlet weak var radiusLabel: UILabel!
    
    @IBOutlet weak var baseLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    //textfieldler
    @IBOutlet weak var baseTextField: UITextField!
   
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var lengthTextField: UITextField!
    
    @IBOutlet weak var radiusTextField: UITextField!
    
    @IBOutlet weak var widthTextField: UITextField!
    
    var delegate: InputVCDelegate?
    //title
    var title_for_input: String = ""

    //seleceted shape
//    var selectedShape: String?
  //  var selectedShape: String = ""
   
    
    
    
    
    

    //burada veriler geçiş yapacak
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        
        print("Done button pressed") //kontrol
        
        
        if(baseTextField.isHidden == false){
            guard(baseTextField.text?.isEmpty == false) else{
                showEmptyFieldAlert()
              return
            }
        }
        
        
        if(heightTextField.isHidden == false){
            guard(heightTextField.text?.isEmpty == false) else{
                showEmptyFieldAlert()
              return
            }
        }
        
        
        if(radiusTextField.isHidden == false){
            guard(radiusTextField.text?.isEmpty == false) else{
                showEmptyFieldAlert()
              return
            }
        }
        
        if(lengthTextField.isHidden == false){
            guard(lengthTextField.text?.isEmpty == false) else{
                showEmptyFieldAlert()
              return
            }
        }
        
        
        if(widthTextField.isHidden == false){
            guard(widthTextField.text?.isEmpty == false) else{
                showEmptyFieldAlert()
              return
            }
        }
        
        let radius_val :Double? = Double(radiusTextField.text!)
        let height_val :Double? = Double(heightTextField.text!)
        let base_val :Double? = Double(baseTextField.text!)
        let length_val :Double? = Double(lengthTextField.text!)
        let width_val :Double? = Double(widthTextField.text!)
        
        
        var area: Double?
        var hypotenuse: Double?
        var perimeter: Double?
        
        if(self.title == "Triangle"){
            if let base = base_val, let height = height_val {
                area = (base * height) / 2
                // Hipotenüs hesabı
                 hypotenuse = sqrt(pow(base, 2) + pow(height, 2))
        
                // Çevre hesabı
                perimeter = base + height + hypotenuse!
            }
            
        }
        
        else if self.title == "Circle" {
            
            if let radius = radius_val{
                area = Double.pi * radius * radius
                perimeter = 2 * Double.pi * radius
            }
        }
        
        //Rectangle
        
        else  {
            
            if let length = length_val , let width = width_val{
                area = length * width
                perimeter = 2 * (length + width)
            }
        }
        
//        var parameters: [String: Double] = [:]
//            
//            if selectedShape == "circle" {
//                guard let radiusText = radiusTextField.text, !radiusText.isEmpty, let radius = Double(radiusText) else {
//                    showEmptyFieldAlert()
//                    return
//                }
//                parameters["radius"] = radius
//            } else if selectedShape == "rectangle" {
//                guard let lengthText = lengthTextField.text, !lengthText.isEmpty, let length = Double(lengthText),
//                      let widthText = widthTextField.text, !widthText.isEmpty, let width = Double(widthText) else {
//                    showEmptyFieldAlert()
//                    return
//                }
//                parameters["length"] = length
//                parameters["width"] = width
//            } else if selectedShape == "triangle" {
//                guard let baseText = baseTextField.text, !baseText.isEmpty, let base = Double(baseText),
//                      let heightText = heightTextField.text, !heightText.isEmpty, let height = Double(heightText) else {
//                    showEmptyFieldAlert()
//                    return
//                }
//                parameters["base"] = base
//                parameters["height"] = height
//            }

       
        
        let rounded_area = round((area ?? 0) * 100) / 100.0
        let rounded_perimeter = round((perimeter ?? 0) * 100) / 100.0
            
        
        // Pass data back to delegate
        //ŞLK GERİ DÖNMEYİ YAPACAKSIN
        self.navigationController?.popViewController(animated: true) // Geri dön
        delegate?.didEnterParameters(data: (rounded_area,rounded_perimeter, self.title ?? "Triangle"))
        
        

        //perfom segueyi kaldırrrr
       // performSegue(withIdentifier: "calculation", sender: self)
           
  
        
            // Optionally show a success alert here if desired, then dismiss
           // self.navigationController?.popViewController(animated: true)
          


           

        
        
    }
        
        
    
    
    
    func showEmptyFieldAlert() {
        let mAlert = UIAlertController(title: "Error", message: "Data cannot be empty", preferredStyle: .alert)
        mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(mAlert, animated: true, completion: nil)
      }
       
        
        
        
        
//        else {
//            if let tempDelegate = delegate {
//                print("delegate is not nil")
//                tempDelegate.addControllerDidFinish(controller: self, text: (base, height))
//            }
//        }
    
    
    //bir yere bastığında remove keyboard yapacak
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide all fields initially
             hideAllFields()
     //   self.title = selectedShape?.capitalized
//        updateUI(for: selectedShape)


//        var shape : String = ""
//        //başlık değiştirme
//        
//        if title_for_input != "" {
//        self.title = title_for_input
//        }
//        else{
//            self.title = "Triangle"
//        }
//        
//        
//         if  shape == title_for_input {
//                   updateUI(for: shape)
//               }
        
        
        // Set title and update UI based on shape selection
               self.title = !title_for_input.isEmpty ? title_for_input.capitalized : "Triangle"
               updateUI(for: self.title ?? "Triangle")

    }
    
    
    func hideAllFields() {
            radiusLabel.isHidden = true
            radiusTextField.isHidden = true
            lengthLabel.isHidden = true
            lengthTextField.isHidden = true
            widthLabel.isHidden = true
            widthTextField.isHidden = true
            baseLabel.isHidden = true
            baseTextField.isHidden = true
            heightLabel.isHidden = true
            heightTextField.isHidden = true
        print("All fields hidden") // Debugging output

        }

    
    func updateUI(for shape: String) {
          
        hideAllFields()

        switch shape.lowercased()  {
            case "circle":
                radiusLabel.isHidden = false
                radiusTextField.isHidden = false
                
            case "rectangle":
                lengthLabel.isHidden = false
                widthLabel.isHidden = false
                lengthTextField.isHidden = false
                widthTextField.isHidden = false
               
               
            case "triangle":
                baseLabel.isHidden = false
                heightLabel.isHidden = false
                baseTextField.isHidden = false
                heightTextField.isHidden = false
              
            default:
                break
            }
        }
  
    
    
    

}
