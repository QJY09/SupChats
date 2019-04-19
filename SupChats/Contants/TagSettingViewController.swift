//
//  TagSettingViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/1.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class TagSettingViewController: UIViewController {
    //Set Nickname Collection
    @IBOutlet weak var NicknameLabel: UILabel!
    @IBOutlet weak var NickNameStackView: UIStackView!
    @IBOutlet weak var CollectNicknameTextFiled: UITextField!
    
    //Set Tags Collection
    @IBOutlet weak var RolesLabel: UILabel!
    @IBOutlet weak var RolesStackView: UIStackView!
    @IBOutlet weak var CollectRolesTecFiled: UITextField!
    
    //set Discriptation Collection
    @IBOutlet weak var DiscriptionLabel: UILabel!
    @IBOutlet weak var DiscriptionStackView: UIStackView!
    @IBOutlet weak var CollectDiscriptionTextView: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Set Nickname and Roles"
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
