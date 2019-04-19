//
//  MyQRCardViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/18.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class MyQRCardViewController: UIViewController {
    //  Personal Detail Card
    @IBOutlet weak var PersonalProtraitImage: UIImageView!
    @IBOutlet weak var PersonalUsername: UILabel!
    @IBOutlet weak var PersonalRegion: UILabel!
    @IBOutlet weak var PersonalGender: UIImageView!
    @IBOutlet weak var PersonalQRCode: UIImageView!
    @IBOutlet weak var PersonalBackgroundImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        CardLayoutSetting()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        CardLayoutSetting()
    }
    
    func CardLayoutSetting(){
        PersonalProtraitImage.image=UIImage.init(data: UserDefaults.standard.data(forKey: "DFSPortrait")!)
        PersonalUsername.text=UserDefaults.standard.string(forKey: "DFSUsername")!
        PersonalRegion.text=UserDefaults.standard.string(forKey: "DFSRegion")!
        if UserDefaults.standard.string(forKey: "DFSUserGender")! == "Man"{
            PersonalGender.image=UIImage.init(named: "Man")
            PersonalGender.isHidden=false
        }else if UserDefaults.standard.string(forKey: "DFSUserGender")! == "Women"{
            PersonalGender.image=UIImage.init(named: "Women")
            PersonalGender.isHidden=false
        }else{PersonalGender.isHidden=true}
        PersonalBackgroundImage.backgroundColor=UIColor.init(red: 107, green: 208, blue: 255, alpha: 10)
        PersonalQRCode.image=UIImage.init(data: UserDefaults.standard.data(forKey: "DFSQRCode")!)
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
