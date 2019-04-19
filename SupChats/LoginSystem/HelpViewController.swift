//
//  HelpViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/19.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit
import LeanCloud
import LeanCloudFeedback

class HelpViewController: UIViewController {
    let Agent=LCUserFeedbackAgent.sharedInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func SetupUI(){
        let FeedBackReplies=NSMutableArray.init()
        
    }
    
    func SettingHelpView(){
        let ContactEmail=RegisterViewController().Email.text
        // Do any additional setup after loading the view.
        Agent?.showConversations(self, title: "Helping", contact: ContactEmail)
        Agent?.countUnreadFeedbackThreads({ (RespondNumber, error) in
            if (error) != nil{
                SupportFunction.ShowNoticeAlert(on: self, with: "Network Error", Message: "Please let your device connect to internet")
            }else{
                
            }
        })
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
