//
//  Chats.swift
//  SupChats
//
//  Created by QJY on 2019/1/16.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class Chats: UIViewController {
    
    @IBOutlet var MorefunctionMenu: UIView!
    @IBOutlet weak var AddFriendBTN: UIButton!
    @IBOutlet weak var CreatGroupBTN: UIButton!
    @IBOutlet weak var QRcodeBTN: UIButton!
    @IBOutlet weak var ComingSoon: UIButton!
    
    //active MoreQuicklyFunction Button
    @IBAction func AddNewFriendAction(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "AddFriendViewControllerID")as! UIViewController, animated: true)
        print("Click AddNewFriends button...")
    }
    @IBAction func CreatNewGroupAction(_ sender: UIButton) {
        print("Click CreatNewGroup button...")
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "GroupChatCodeViewControllerID")as! UIViewController, animated: true)
    }
    @IBAction func ScanQRcodeAction(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "ScanQRViewControllerID")as! UIViewController, animated: true)
        print("Click ScanQRcode button...")
    }
    @IBAction func ComingSoonAction(_ sender: UIButton) {
        print("Click ComingSoon button...")
    }
    
    var controlMoreQuicklyFunction=true
    @IBAction func MoreQuicklyFunction(_ sender: UIBarButtonItem) {
        
        print("Click MoreQuicklyFunction Button...")
        if controlMoreQuicklyFunction{
            MorefunctionMenu.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            print("Show the MoreQuicklyView...")
        }else{
            MorefunctionMenu.isHidden = true
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            print("Closing the MoreFunctionView...")
        }
        controlMoreQuicklyFunction = !controlMoreQuicklyFunction
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MorefunctionMenu.layer.shadowOpacity=0.5
        MorefunctionMenu.layer.cornerRadius=20
        MorefunctionMenu.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ComingSoon.isEnabled=true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

