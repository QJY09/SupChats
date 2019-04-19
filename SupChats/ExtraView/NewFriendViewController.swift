//
//  NewFriendViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/24.
//  Copyright © 2019 QJY. All rights reserved.
//


import UIKit
import ChatKit

class NewFriendViewController: UIViewController {
    //  New Friends Detail
    @IBOutlet weak var NewFriendsStackView: UIStackView!
    @IBOutlet weak var NewFriendsPortrait: UIImageView!
    @IBOutlet weak var NewFriendsUsername: UILabel!
    @IBOutlet weak var NewFriendsGender: UIImageView!
    @IBOutlet weak var SupChatsIDLabel: UILabel!
    @IBOutlet weak var NewFriendsSupChatsID: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var NewFriendsRegion: UILabel!
    
    
    //  Search Friend Source
    var PassIsSearchFromSupChats=Bool()
    var NewFriendsobjectID=String()
    var NewFriendsAVUserID=String()
    var Protrait:UIImage!
    var Signature=String()
    var Username=String()
    var SupChatsID=String()
    var Region=String()
    var QRCode:UIImage!
    var Gender=String()
    var Email=String()
    var ProtraitLink=String()
    
    //  More Friends Detail
    @IBOutlet weak var SearchFriendStackView: UIStackView!
    @IBOutlet weak var SearchSource: UILabel!
    @IBOutlet weak var AddNewFriendBTN: UIButton!
    @IBAction func AddNewFriendAction(_ sender: UIButton) {
        self.view.MakeRotateBallLoading(Title: "Adding friend", Enable: true)
        print("Try to add New friend \(self.NewFriendsAVUserID)")
        //  Add relation in the database
        LeanCloudSearch.AddNewFriends(on: self, with: self.NewFriendsAVUserID) { (Results) in
            sleep(1)
            if Results == "true"{
                print("Add frined Succeed")
                SaveDetailToLocal()
//                self.view.DismissBallRotationLoading()
                //   Creat Conversation with new friend
                let ChatKit=LCChatKit.sharedInstance().client
                ChatKit?.createConversation(withName: "\(self.NewFriendsUsername)", clientIds: [self.NewFriendsAVUserID], callback: { (Conversation, Error) in
                    print("创建会话成功")
                    Conversation?.send(AVIMTextMessage(text: "Hello\(self.NewFriendsUsername)", attributes: nil), callback: { (Succeed, Error) in
                        print("发送信息")
                        if Succeed{
                            let ConversationViewController=LCCKConversationViewController(conversationId: Conversation?.conversationId)
                            self.navigationController?.pushViewController(ConversationViewController!, animated: true)
                        }
                    })
                })
               
//                ChatKit?.createConversation(withName: "\(self.NewFriendsUsername)", clientIds: [self.NewFriendsAVUserID], attributes: nil, options: AVIMConversationOption.unique, callback: { (Conversation, Error) in
//                    print("\(self.NewFriendsAVUserID)")
//                    print("\(Conversation)")
//                    if (Conversation != nil){
//                        Conversation?.send("Hello\(self.NewFriendsUsername)" as! AVIMMessage, callback: { (Sent, Error) in
//
//                            if (Sent){
//                                print("即将转跳到聊天界面--the view will jump to Conversation View Controller\(Sent)")
//                                self.view.DismissBallRotationLoading()
//                                //  Save the Friends Detail to Local
//                                SaveDetailToLocal()
//                                let ConversationViewController=LCCKConversationViewController(conversationId: Conversation?.conversationId) as! LCCKConversationViewController
//                                self.navigationController?.pushViewController(ConversationViewController, animated: true)
//
//                            }else{
//                                print("Send Message Error开始与好友聊天错误\(Error)")
//
//                            }
//                        })
//                    }else{print("创建新的聊天失败--Creat Conversation Error \(Error)")
//                        SupportFunction.ShowNoticeAlert(on: self, with: "Failed to creat Conversation with friend", Message: "Netword is not working, please check your network")
//
//                    }
//                    //  Send the frist message the conversation
//
//                })
                //  ------------End Creat Conversation function
                //                ChatKit?.createConversation(withName: "\(self.NewFriendsUsername)", clientIds: [self.NewFriendsAVUserID], callback: { (Conversation, Error) in
                //                    if (Error != nil){
                //                        Conversation?.send("Hello\(self.NewFriendsUsername)" as! AVIMMessage, callback: { (Sent, Error) in
                //
                //                            if (Sent){
                //                                print("即将转跳到聊天界面--the view will jump to Conversation View Controller\(Sent)")
                //                                self.view.DismissBallRotationLoading()
                //                                //  Save the Friends Detail to Local
                //                                SaveDetailToLocal()
                //                                let ConversationViewController=LCCKConversationViewController(conversationId: Conversation?.conversationId) as! LCCKConversationViewController
                //                                self.navigationController?.pushViewController(ConversationViewController, animated: true)
                //
                //                            }else{
                //                                print("Send Message Error开始与好友聊天错误\(Error)")
                //
                //                            }
                //                        })
                //                    }else{
                //                        print("创建新的聊天失败--Creat Conversation Error \(Error)")
                //                        SupportFunction.ShowNoticeAlert(on: self, with: "Failed to creat Conversation with friend", Message: "Netword is not working, please check your network")
                //                    }
                //                })
            }else{
                SupportFunction.ShowNoticeAlert(on: self, with: "Failed to add friend", Message: "Netword is not working, please check your network")
            }
        }
        

    
    func SaveDetailToLocal(){
        //  Save Friends Detail in the loaction
        let QRCodeData:Data=UIImagePNGRepresentation(UIImage(named: "QR-code-scan-512x512")!)as! Data
        FriendsHandler.SaveFriendsDataSrouce(AVUserID: NewFriendsAVUserID, Profile: ProtraitLink, Username: Username, SupchatsID: SupChatsID, Region: Region, QRCode: QRCodeData, Gender: Gender, Signature: Signature, CostomerName: "")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingFriendDetail()
        navigationController?.navigationBar.isHidden=false
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.navigationBar.isHidden=false
    }
    
    /////////////////传递数据出错 检查出错问题
    func LoadingFriendDetail(){
        self.view.MakeRotateBallLoading()
        print("从搜索界面传来的zSupChatsID是--Pass SupChatsID from New Friends View is\(SupChatsID)")
        print(PassIsSearchFromSupChats)
        LeanCloudSearch.GetUserAllDetailBySupChats(SupChatsID: SupChatsID) { (Details) in
            for Detail in Details!{
                self.NewFriendsobjectID=(Detail as AnyObject).object(forKey: "objectId") as! String
                self.NewFriendsAVUserID=(Detail as AnyObject).object(forKey: "AVUserID") as! String
                self.Email=(Detail as AnyObject).object(forKey: "Email") as! String
                self.Region=(Detail as AnyObject).object(forKey: "Region") as! String
                self.Username=(Detail as AnyObject).object(forKey: "Username") as! String
                if (Detail as AnyObject).object(forKey: "Gender")==nil{
                    self.Gender=""
                }else{
                                    self.Gender=(Detail as AnyObject).object(forKey: "Gender") as! String
                }
                let ProtraitFile = (Detail as? AVObject)?.object(forKey: "Portrait") as? AVFile
                self.ProtraitLink=(ProtraitFile?.url())!
                print(self.ProtraitLink)
                print(self.NewFriendsobjectID)
                print(self.NewFriendsAVUserID)
                print(self.Email)
                print(self.Region)
                print(self.Username)
                print(self.Gender)
                print(self.SupChatsID)
                self.SettingNewDetail()
            }
        }

        
    }
    
    func SettingNewDetail() {
        if ProtraitLink==""{
            NewFriendsPortrait.image=UIImage.init(named: "Broken Picture")
        }else{
            NewFriendsPortrait.kf.setImage(with: URL(string: "\(ProtraitLink)"))
        }
        //  Setting the friend Username
        if Username==""{
            NewFriendsUsername.text=SupChatsID
        }else{
            NewFriendsUsername.text=Username
        }
        
        //  Setting new user SupChatsID
        if SupChatsID==""{
            SupChatsIDLabel.isHidden=true
            NewFriendsSupChatsID.isHidden=true
        }else{
            SupChatsIDLabel.isHidden=false
            NewFriendsSupChatsID.isHidden=false
            NewFriendsSupChatsID.text=SupChatsID
        }
        //  Setting new user Gender
        if Gender=="Man"{
            NewFriendsGender.image=UIImage.init(named: "Man")
        }else if Gender=="Women"{
            NewFriendsGender.image=UIImage.init(named: "Women")
        }else{
            NewFriendsGender.isHidden=true
        }
        //  Setting new user Region
        if Region==""{
            CountryLabel.isHidden=true
            NewFriendsRegion.isHidden=true
        }else{
            CountryLabel.isHidden=false
            NewFriendsRegion.isHidden=false
            NewFriendsRegion.text=Region
        }
        //  Setting new user Search User Method
        let SearchUserView = SearchFriendsViewController()
        if SearchUserView.IsSearchFromSupChats==true{
            self.SearchSource.text="SupChatsID"
        }else{
            self.SearchSource.text="Email"
        }
        if SupChatsID==""{
            SupportFunction.delay(by: 3) {
                self.view.DismissBallRotationLoading()
                SupportFunction.ShowNoticeAlert(on: self, with: "Connect Eroor", Message: "Please the network and try again")
            }
        }else{
            self.view.DismissBallRotationLoading()
        }
        

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
