//
//  SettingViewController.swift
//  SupChats
//
//  Created by QJY on 2019/2/26.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    //Account & Security
    @IBOutlet weak var AccountSecurityStackView: UIStackView!
    @IBOutlet weak var AccountSecurityBTN: UIButton!
    @IBAction func AccountSecurtyAction(_ sender: UIButton) {
        print("Click Account & Secruity BTN")
    }
    
    //Notification
    @IBOutlet weak var NotificationStackView: UIStackView!
    @IBOutlet weak var NotificationBTN: UIButton!
    @IBAction func ANotificationAction(_ sender: UIButton) {
        print("Click Notification BTN")
    }
    
    //Privacy
    @IBOutlet weak var PrivacyStackView: UIStackView!
    @IBOutlet weak var PrivacyBTN: UIButton!
    @IBAction func PrivacyAction(_ sender: UIButton) {
        print("Click Privacy BTN")
    }

    //General
    @IBOutlet weak var GeneralStackView: UIStackView!
    @IBOutlet weak var GeneralBTN: UIButton!
    @IBAction func GeneralAction(_ sender: UIButton) {
        print("Click General BTN")
    }
    
    //Help & Feedback
    @IBOutlet weak var HelpFeedbackStackView: UIStackView!
    @IBOutlet weak var HelpFeedbackBTN: UIButton!
    @IBAction func HelpFeedbackAction(_ sender: UIButton) {
        print("Click Log Out BTN")
}
    
    //About SupChats
    @IBOutlet weak var AboutSupChatsStackView: UIStackView!
    @IBOutlet weak var AboutSupChatsLabel: UILabel!
    @IBOutlet weak var AboutSupChatsbackBTN: UIButton!
    @IBAction func AboutSupChatsAction(_ sender: UIButton) {
        print("Click About Supchats BTN")
    }
    
    //Log Out
    @IBOutlet weak var LogOutStackView: UIStackView!
    @IBOutlet weak var LogOutbackBTN: UIButton!
    @IBAction func LogOutAction(_ sender: UIButton) {
        print("Click Log Out BTN")
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.hidesBottomBarWhenPushed=true

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
