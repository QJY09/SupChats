//
//  SettingGenderViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/3.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

let GenderList=["Man","Women","Secret"]

class SettingGenderViewController: UIViewController {

    @IBOutlet weak var SettingGenderStackView: UIStackView!
    @IBOutlet weak var GenderTextField: UITextField!
    @IBOutlet weak var SaveGenderBTN: UIButton!
    @IBAction func SaveGenderActive(_ sender: UIButton) {
        print("Save Gender In Server")
        UpdateUserDetail.UpdateGenderWithCQL(with: self.GenderTextField.text!, CloudObjectID: UserDefaults.standard.string(forKey: "DFSUserDetailID")!) { (Succeed) in
            if Succeed=="true"{
            UserDefaults.standard.set(self.GenderTextField.text!, forKey: "DFSUserGender")
            }
            print("Update User \(Succeed)")
        }
        navigationController?.popViewController(animated: true)
    }
    
    func SettingGenderLayout(){
        CreatRegionPicker()
        GenderTextField.placeholder=UserDefaults.standard.string(forKey: "DFSUserGender")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingGenderLayout()
        // Do any additional setup after loading the view.
    }
    
    func CreatRegionPicker() {
        let GenderPickerView=UIPickerView()
        GenderPickerView.delegate=self
        GenderTextField.inputView = GenderPickerView
        CreatToolbarForRegionPicker()
    }
    @objc func DissmissKeyboard(){
        view.endEditing(true)
    }
    func CreatToolbarForRegionPicker() {
        let GenderPickerToolbar=UIToolbar()
        GenderPickerToolbar.sizeToFit()
        let DoneBTN = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SettingGenderViewController.DissmissKeyboard))
        GenderPickerToolbar.setItems([DoneBTN], animated: true)
        GenderPickerToolbar.isUserInteractionEnabled=true
        GenderTextField.inputAccessoryView=GenderPickerToolbar
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
extension SettingGenderViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GenderList.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        GenderTextField.text=GenderList[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GenderList[row]
    }
}
