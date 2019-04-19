//
//  SettingRegionViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/3.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit


class SettingRegionViewController: UIViewController {
let RegionDataList = ["Andorra","Afghanistan","Aland Islands","Albania","Algeria","American Samoa","Angola","Anguilla","Antigua And Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia And Herzegovina","Botswana","Brazil","Brunei Darussalam","Bulgaria","BurkinaFaso","Burundi","Cambodia","Cameroon","Canada","CapeVerde","Caribbean Netherlands","Cayman Islands","Central African Republic","Chad","Chile","Colombia","Comoros","CostaRica","Cote DIvoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Democratic Republic Of The Congo","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","ElSalvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Faroe Islands","Federated States Of Micronesia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Guyanne Francaise","Haiti","Honduras","HongKong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Isle Of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar","Namibe”,”Nauru","Nepal","Netherlands","New Caledonia","NewZealand","Nicaragua","Niger","Nigeria","NorthKorea","NorthernMarianaIslands","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","China","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Republic Of Ireland","Republic Of The Congo","Reunion","Romania","Russia","Rwanda","Saint Barthelemy","SaintKittsAndNevis","SaintLucia","Saint Martin","Saint Pierre Et Miquelon","Saint Vincent And The Grenadines","Samoa","San Marino","Saoo Tome And Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Sint  Marteen","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea","South Soudan","Spain","SriLanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad And Tobago","Tunisia","Turkey","Turkmenistan","Turks And Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","VaticanCity","Venezuela","Vietnam","Virgin Islands","Virgin Islands British","Yemen","Zambia","Zimbabwe"]
    @IBOutlet weak var RegionStackView: UIStackView!
    @IBOutlet weak var RegionTextView: UITextField!
    @IBOutlet weak var SaveRegionBTN: UIButton!
    @IBAction func SaveRegionActive(_ sender: UIButton) {
        print("Save new Region")
        UpdateUserDetail.UpdateRegionWithCQL(with: self.RegionTextView.text!, CloudObjectID: UserDefaults.standard.string(forKey: "DFSUserDetailID")!) { (Succeed) in
            if Succeed=="true"{
                UserDefaults.standard.set(self.RegionTextView.text!,forKey: "DFSRegion")
            }
            print("Update Region \(Succeed)")
        }
        navigationController?.popViewController(animated: true)
    }
    
    func CreatRegionPicker() {
        let RegionPickerView=UIPickerView()
        RegionPickerView.delegate=self
        RegionTextView.inputView = RegionPickerView
        CreatToolbarForRegionPicker()
    }
    
    @objc func DissmissKeyboard(){
        view.endEditing(true)
    }
    
    func CreatToolbarForRegionPicker() {
        let RegionPickerToolbar=UIToolbar()
        RegionPickerToolbar.sizeToFit()
        let DoneBTN = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(RegisterViewController.DissmissKeyboard))
        RegionPickerToolbar.setItems([DoneBTN], animated: true)
        RegionPickerToolbar.isUserInteractionEnabled=true
        RegionTextView.inputAccessoryView=RegionPickerToolbar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegionTextView.placeholder=UserDefaults.standard.string(forKey: "DFSRegion")

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
extension SettingRegionViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return RegionDataList.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        RegionTextView.text=RegionDataList[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return RegionDataList[row]
    }
}
