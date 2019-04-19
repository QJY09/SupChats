//
//  NotificationViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/3.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    //Not open Supchats
    @IBOutlet weak var MessageNotificationStackView: UIStackView!
    @IBOutlet weak var MessageNotificationLabel: UILabel!
    @IBOutlet weak var MessageNotificationSwitch: UISwitch!
    
    @IBOutlet weak var CallNotificationStackView: UIStackView!
    @IBOutlet weak var CallNotificationLabel: UILabel!
    @IBOutlet weak var CallNotificationSwitch: UISwitch!
    
    @IBOutlet weak var ShowMessageDetailStackView: UIStackView!
    @IBOutlet weak var ShowMessageDetailLabel: UILabel!
    @IBOutlet weak var ShowMessageDetailSwitch: UISwitch!
    
    //Opening Supchats
    @IBOutlet weak var SoundStackView: UIStackView!
    @IBOutlet weak var SoundLabel: UILabel!
    @IBOutlet weak var SoundSwitch: UISwitch!
    
    @IBOutlet weak var VibrateStackView: UIStackView!
    @IBOutlet weak var VibrateLabel: UILabel!
    @IBOutlet weak var VibrateSwitch: UISwitch!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
