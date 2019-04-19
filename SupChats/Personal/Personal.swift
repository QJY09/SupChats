//
//  Personal.swift
//  SupChats
//
//  Created by QJY on 05/09/2018.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit

class Personal: UIViewController {
    //Personal Information
    @IBOutlet weak var PersonalStack: UIStackView!
    @IBOutlet weak var PersonalPortrait: UIImageView!
    @IBOutlet weak var PersonalNickname: UILabel!
    @IBOutlet weak var PersonalRegion: UILabel!
    @IBOutlet weak var PersonalSupChatsID: UILabel!
    @IBOutlet weak var PersonalStackView: UIView!
    @IBOutlet weak var PersonalQRcodeText: UILabel!
    @IBOutlet weak var PersonalQRID: UIImageView!
    @IBOutlet weak var PersonalStackViewBTN: UIButton!
    @IBAction func PersonalDetailViewAction(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "PersonalDetailViewControllerID")as! UIViewController, animated: true)
    }
    
    
    //QRCodeID
    @IBOutlet weak var QRCodeLabel: UILabel!
    @IBOutlet weak var QRCode: UIImageView!
    
    //Setting
    @IBOutlet weak var SettingStackView: UIStackView!
    @IBOutlet weak var SettingImage: UIImageView!
    @IBOutlet weak var SettingLabel: UILabel!
    @IBOutlet weak var SettingPushRight: UIImageView!
    @IBOutlet weak var SettingCellBTN: UIButton!
    @IBAction func SettingCellActive(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier:"SettingViewControllerID")as! UIViewController, animated: true)
    }
    
    
    
    
    func PersonalLayout(){

        //  Setting Personal Detail
        if UserDefaults.standard.data(forKey: "DFSPortrait") == nil{
            PersonalPortrait.image=UIImage.init(imageLiteralResourceName: "Personal")
        }else{
            PersonalPortrait.image=UIImage.init(data: UserDefaults.standard.data(forKey: "DFSPortrait")!)
        }
        if UserDefaults.standard.string(forKey: "DFSUsername") == nil {
            PersonalNickname.text! = "nil"
        }else{
            PersonalNickname.text=UserDefaults.standard.string(forKey: "DFSUsername")!
        }
        if UserDefaults.standard.string(forKey: "DFSRegion") == nil {
            PersonalRegion.text! = "nil"
        }else{
            PersonalRegion.text=UserDefaults.standard.string(forKey: "DFSRegion")!
            
        }
        if UserDefaults.standard.string(forKey: "DFSSupChatsID") == nil {
            PersonalSupChatsID.text! = "nil"
        }else{
            PersonalSupChatsID.text=UserDefaults.standard.string(forKey: "DFSSupChatsID")!
        }
        PersonalQRID.backgroundColor=UIColor.init(red: 108, green: 208, blue: 255, alpha: 10)
///        PersonalQRID.image=UserDefaults.standard.object(forKey: "DFLQRCode")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonalLayout()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        PersonalLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

