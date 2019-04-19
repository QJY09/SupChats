//
//  AccountSecurityViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/3.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class AccountSecurityViewController: UIViewController {

    //Show SupChatsID
    @IBOutlet weak var SupChatsIDStackView: UIStackView!
    @IBOutlet weak var SupChatsLabel: UILabel!
    @IBOutlet weak var SupChatsUserID: UILabel!
    
    //Email Cell
    @IBOutlet weak var EmailStackView: UIStackView!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    @IBOutlet weak var EmailViewBTN: UIButton!
    @IBAction func EmailViewActive(_ sender: UIButton) {
        print("Push to Email Edite View")
    }
    
    
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
