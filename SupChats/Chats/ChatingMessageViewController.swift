//
//  ChatingMessageViewController.swift
//  SupChats
//
//  Created by QJY on 05/09/2018.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit

class ChatingMessageViewController: RCConversationViewController {
    @IBOutlet var ChatsMessageToolView: UIView!
    @IBOutlet var ChatsMessageVoiceButton: UIButton!
    @IBOutlet var ChatsMessageEmojiButton: UIButton!
    @IBOutlet var ChatsMessageMoreButton: UIButton!
    @IBOutlet var ChatsMessageSendTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Enter ChatingMessageViewController")
        
        
        // Do any additional setup after loading the view.
    self.targetId = RCIMClient.shared().currentUserInfo.userId
    self.conversationType = RCConversationType.ConversationType_PRIVATE


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
