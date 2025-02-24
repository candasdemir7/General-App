//
//  PlayerVC.swift
//  MustafacanDasdemir_HW2
//
//  Created by Can Daşdemir on 29.10.2024.
//

import UIKit

class PlayerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,  UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var mPickerView: UIPickerView!
    
    @IBOutlet weak var mTableView: UITableView!
    
    @IBOutlet weak var bjkImg: UIImageView!
    @IBOutlet weak var smallGs: UIImageView!
   
    @IBOutlet weak var smallFb: UIImageView!
    
    
    var teamPlayers = [String]()
    var teamPlayersforpv = [String]()
    var flag_names = [String]()
    
    var imgname: String = ""
    var cnt_bjk: Int = 0
    var cnt_fb: Int = 0
    var cnt_gs: Int = 0
    var foo = [([String], [String])]()
    
    
    func populateDataforpv(team: String) {
        
        if let path = Bundle.main.path(forResource: "players", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        if (dict.allKeys[0] as! String) == team {
                            teamPlayersforpv.append(dict.allValues[0] as! String)
                        }
                    }
                }
            }
        }
        
    }
    
    
    func populateData(team: String) {
        
        if let path = Bundle.main.path(forResource: "players", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        if (dict.allKeys[0] as! String) == team {
                            teamPlayers.append(dict.allValues[0] as! String)
                            flag_names.append(team)
                        }
                    }
                }
            }
        }
        
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        teamPlayersforpv.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return teamPlayersforpv[row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teamPlayers.count
        
    }
    
    
    
    //CELL IDENTİFİERI ASLA UNUTMA
    
    //Ayrıca delegate data source player vcye yap direkttttt
    
    //IMAGELARDA USERINTERACTİON ENABLED VERRRRR
    
    
    // Filling the rows with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        
        // Recommended way
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        
        let (flag_name,player_name) = (flag_names[indexPath.row],teamPlayers[indexPath.row])
        cell.textLabel?.text = player_name
        
        
        
        
        let mImage = UIImage(named: flag_name)
        cell.imageView?.image = mImage
        
        return cell
    }
    
    
    @IBAction func tapBjk(_ sender: UITapGestureRecognizer) {
        teamPlayersforpv.removeAll()
        
        if cnt_bjk < 1 {
            populateData(team: "besiktas")
        }
        
        populateDataforpv(team: "besiktas")
        
        cnt_bjk = 1
        imgname = "besiktas"
        
        mPickerView.reloadAllComponents()
        mTableView.reloadData()
        
    }
    
    
    @IBAction func tapFb(_ sender: UITapGestureRecognizer) {
        
        teamPlayersforpv.removeAll()
        
        if cnt_fb < 1 {
            populateData(team: "fenerbahce")
        }
        
        populateDataforpv(team: "fenerbahce")
        
        imgname = "fenerbahce"
        cnt_fb = 1
        
        mPickerView.reloadAllComponents()
        mTableView.reloadData()
        
    }
    
    
    
    @IBAction func tapGs(_ sender: UITapGestureRecognizer) {
        
        teamPlayersforpv.removeAll()
        
        if cnt_gs < 1 {
            populateData(team: "galatasaray")
        }
        
        populateDataforpv(team: "galatasaray")
        
        imgname = "galatasaray"
        cnt_gs = 1
        
        mPickerView.reloadAllComponents()
        mTableView.reloadData()
    }
    

}
