//
//  RongChatsListViewController.swift
//  SupChats
//
//  Created by QJY on 2018/12/25.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit

class RongChatsListViewController: RCConversationListViewController {

    let ConVC=RCConversationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        //Use AppDelegate 应用AppDelegate
        let appDelegate = (UIApplication.shared.delegate)as! AppDelegate
        appDelegate.ConnectServer(completion: {()->Void in
            print("Connect Success to Chats List")
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue
            ])
            self.refreshConversationTableViewIfNeeded()
        })
        print("Chats Table View finish loading 加载列表完成")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden=false
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let targetVC = segue.destination as? RCConversationViewController
        targetVC?.targetId=self.ConVC.targetId
        targetVC?.conversationType=self.ConVC.conversationType
        targetVC?.title=ConVC.title
        self.tabBarController?.tabBar.isHidden=true
        
    }
    
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        
    //  change to Conversation View
    //  let ConVC=RCConversationViewController()
        ConVC.targetId=model.targetId
        ConVC.conversationType=RCConversationType.ConversationType_PRIVATE
        ConVC.title=model.conversationTitle
    
    // self.navigationController?.pushViewController(ConVC, animated: true)
    // self.tabBarController?.tabBar.isHidden=true
    
        self.performSegue(withIdentifier: "ChangeToCoversationView", sender: self)
    }
}
