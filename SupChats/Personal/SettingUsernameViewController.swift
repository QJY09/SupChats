//
//  SettingUsernameViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/3.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class SettingUsernameViewController: UIViewController {


    @IBOutlet weak var NicknameStackView: UIStackView!
    @IBOutlet weak var NicknameTextView: UITextField!
    @IBOutlet weak var SaveNewUserBTN: UIButton!
    @IBAction func SaveNewUsernameActive(_ sender: UIButton) {
        print("在服务器上跟新用户名称")
        UpdateUserDetail.UpdateNicknameWithCQL(with: NicknameTextView.text!, CloudObjectID: UserDefaults.standard.string(forKey: "DFSUserDetailID")!) { (Succeed) in
            if Succeed=="true"{
                UserDefaults.standard.set(self.NicknameTextView.text!,forKey: "DFSUsername")
            }
            print("Update Nickname \(Succeed)")
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Setting New Nickname"
        NicknameTextView.placeholder=UserDefaults.standard.string(forKey: "DFSUsername")
        
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
