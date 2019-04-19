//
//  RongChatingViewController.swift
//  SupChats
//
//  Created by QJY on 2018/12/25.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit

class RongChatingViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Enter ChatingMessageViewController")
        
        
        // Do any additional setup after loading the view.
        self.targetId = RCIMClient.shared().currentUserInfo.userId
        self.title=RCIMClient.shared()?.currentUserInfo.name
        self.conversationType = RCConversationType.ConversationType_PRIVATE
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
