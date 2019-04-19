//
//  ContantsPersonalInformationView.swift
//  SupChats
//
//  Created by QJY on 05/09/2018.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit

class ContantsPersonalInformationView: UIViewController {
    var FriendsDetailData=[FriendsInformation]()
    
    //User Information Sapce
    @IBOutlet weak var ContantsPersonalStackView: UIStackView!
    @IBOutlet weak var ContantsPersonalView: UIView!
    @IBOutlet var UserPersonalHeadPortrait: UIImageView!
    @IBOutlet weak var ServerName: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet var UserName: UILabel!
    @IBOutlet weak var SupChatsIDLabel: UILabel!
    @IBOutlet var UserSupChatsID: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet var UserCountry: UILabel!
    
    //Tag View
    @IBOutlet weak var TagStackView: UIStackView!
    @IBOutlet weak var TagSetting: UILabel!
    @IBOutlet weak var TagCellBTN: UIButton!
    @IBOutlet weak var TagRightToPushSign: UIImageView!
    @IBAction func TagCellActive(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "TagSettingViewControllerID")as! UIViewController, animated: true)
    }
    
    
    
    //User Personal Sapce Table Cell
    @IBOutlet weak var PersonalStackView: UIStackView!
    @IBOutlet weak var PersonalMomentLabel: UILabel!
    @IBOutlet weak var MomentEX1: UIImageView!
    @IBOutlet weak var MomentEX2: UIImageView!
    @IBOutlet weak var MomentEX3: UIImageView!
    @IBOutlet weak var MomentEX4: UIImageView!
    @IBOutlet weak var MomentRightToPushSign: UIImageView!
    @IBOutlet weak var PersonalCellBTN: UIButton!
    @IBAction func PersonalCellActive(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "MomentTableViewControllerID")as! UIViewController, animated: true)
    }
    
    
    @IBAction func ChatButton(_ sender: UIButton) {
        print("Click Chating Button, transfor to Chating Message View")
        
    }
    
    @IBAction func CallButton(_ sender: UIButton) {
        print("Click Call Button, transfor to Call View")
    }
    @IBAction func VideoCall(_ sender: UIButton) {
        print("Click Video Call Button, transfor to Video Call Button")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        /////////   tabBarController?.tabBar.isHidden = true
        PerpareForFriendInformation()
        //User Persoanl Information View:
        //Head Portrait
        UserPersonalHeadPortrait.image = UIImage(named:"标志")
        UserPersonalHeadPortrait.layer.cornerRadius = 25
        UserPersonalHeadPortrait.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        PerpareForFriendInformation()
        //User Persoanl Information View:
        //Head Portrait
        UserPersonalHeadPortrait.image = UIImage(named:"标志")
        UserPersonalHeadPortrait.layer.cornerRadius = 25
        UserPersonalHeadPortrait.layer.masksToBounds = true
    }
    
    var FriendsAVUserID:String=""
    func PerpareForFriendInformation(){
        if FriendsHandler.FetchFriendsInformaitonObject() != nil{
            FriendsDetailData=FriendsHandler.FetchFriendsInformaitonObject()
        }
        for FriendData in FriendsDetailData{
            if SelectedName==FriendData.value(forKey: "username")as! String{
//                if FriendData.value(forKey: "userusercostomername")as? String == nil{
//                UserName.text=FriendData.value(forKey: "userusername")as? String
//                NameLabel.isHidden=true
//                ServerName.isHidden=true
//                }else{
//                UserName.text=FriendData.value(forKey: "userusercostomername")as? String
                print(FriendData.value(forKey: "userprofile")as! String)
                UserPersonalHeadPortrait.kf.setImage(with: URL(string: "\(FriendData.value(forKey: "userprofile")as! String)"))
                UserName.text=FriendData.value(forKey: "username")as? String
                ServerName.text=FriendData.value(forKey: "username")as? String
//                }
                UserSupChatsID.text=FriendData.value(forKey: "usersupchatsid")as? String
                UserCountry.text=FriendData.value(forKey: "userregion")as? String
                FriendsAVUserID=FriendData.value(forKey: "avuserid")as! String
                break
            }else{
                continue
            }
        }

    }
    
    func CreatChatsWithFriends(){
        
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
