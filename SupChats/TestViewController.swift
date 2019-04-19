//
//  TestViewController.swift
//  SupChats
//
//  Created by QJY on 2019/2/27.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit
import LeanCloud
import CoreData
import LeanCloudFeedback
import AVKit
import AVOSCloudIM
import AVOSCloud

class TestViewController: UIViewController {

    let NewUserID = "5c892ff944d9040066621e64"
    let AGent=LCUserFeedbackAgent.sharedInstance()
    
    
    @IBOutlet weak var TestLabel: UILabel!
    @IBOutlet weak var TestImage: UIImageView!
    @IBOutlet weak var Test: UITextField!
    @IBOutlet weak var Test2: UITextField!
    @IBAction func ClickBTNaction(_ sender: UIButton) {
        print("点击")
        
        LeanCloudSearch.GetUserAllDetailBySupChats(SupChatsID: Test.text!) { (Details) in
            for Detail in Details!{
                var Gender=""
                let  NewFriendsobjectID=(Detail as AnyObject).object(forKey: "objectId") as! String
                let  NewFriendsAVUserID=(Detail as AnyObject).object(forKey: "AVUserID") as! String
                let Email=(Detail as AnyObject).object(forKey: "Email") as! String
                let Region=(Detail as AnyObject).object(forKey: "Region") as! String
                let Username=(Detail as AnyObject).object(forKey: "Username") as! String
                if (Detail as AnyObject).object(forKey: "Gender")==nil{
                    Gender=""
                }else{
                    Gender=(Detail as AnyObject).object(forKey: "Gender") as! String
                }
                let ProtraitFile = (Detail as AnyObject).object(forKey: "Protrait") as? AVFile
                let URLLink=ProtraitFile?.url()
                let URl=ProtraitFile?.object(forKey: "url")
                print(URl)
                print(URLLink)
                print(NewFriendsobjectID)
                print(NewFriendsAVUserID)
                print(Email)
                print(Region)
                print(Username)
                print(Gender)
                print(self.Test.text!)
            }
        }
        
//        let ChatKit=LCChatKit.sharedInstance().client
//        ChatKit?.createConversation(withName: "AAAA_qjy124", clientIds: ["5c892ff944d9040066621e64"], callback: { (conversation, Error) in
//            print("创建会话成功")
//            conversation?.send(AVIMTextMessage(text: "Hello \(self.Test.text)", attributes: nil), callback: { (Succeed, Error) in
//                print("发送信息")
//                if Succeed{
//                    let VC=LCCKConversationViewController(conversationId: conversation?.conversationId)
//                    self.present(VC!, animated: true, completion: {print("运行发送")})
//                }
//            })
//        })
//        let chat = LCChatKit.sharedInstance()?.client
//        chat?.createConversation(withName: "QJY", clientIds: ["5c54cae217b54d005747c816"], callback: { (conversation, error) in
//
//            conversation?.send(AVIMTextMessage(text: "11111111", attributes: nil), callback: { (succ, err) in
//
//                if succ {
//                    let vc = LCCKConversationViewController(conversationId: conversation?.conversationId)
//                    self.present(vc!, animated: true, completion: {
//
//                    })
//                }
//            })
//        })
//        UpdateUserDetail.UpdateNicknameWithCQL(with: Test.text!, CloudObjectID: NewUserID) { (succeed) in
//            print("跟新数据成功\(succeed)")
//        LeanCloudSearch.GetUserAllDetailBySupChats(SupChatsID: "AAAA_qjy124") { (Details) in
//            for Detail in Details!{
//                let DetailEmail=(Detail as AnyObject).object(forKey: "Email") as? String
//                print("\(DetailEmail)")
//                let DetailRegion=(Detail as AnyObject).object(forKey: "Region") as? String
//                print("\(DetailRegion)")
    }
}
    
//
////        UserDetail.getFirstObjectInBackground { (ServerUsername, error) in
////            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
////                //                completion(error.localizedDescription)
////            }
////            if let ServerUsername=ServerUsername,let Name=ServerUsername["Username"] as? String{
////                print(Name)
////            }
////        }
////        UserDetail.getFirstObjectInBackground{(ServerSupChatsID,error) in
////            if let error=error{print("Can't Find UserID 未找到用户ID",error.localizedDescription)
////                //                completion(error.localizedDescription)
////            }
////            if let ServerSupChatsID=ServerSupChatsID,let SupChatsID=ServerSupChatsID["SupChatsID"] as? String{
////                print(SupChatsID)
////            }
////        }
//
//
////        AVUser.logInWithUsername(inBackground: SupChatsID , password: Password){(user,error)-> Void in
////            if (user != nil){
////                print("Login Succeeded...登录成功")
////                LeanCloudSearch.AddNewFriends(on: self, with:"5c892ff944d9040066621e64"){(bool) in
////                    print("Add friends done\(bool)")
////                }
////            }else{
////                print("Login Failed....登录失败")
////                //  Remove Animation
////                self.view.DismissBallRotationLoading()
////                //  Notice to user
////                SupportFunction.ShowNoticeAlert(on: self, with: "Login Error", Message: "Please check you Email/Password, Try again later")
////            }
////        }
////        LeanCloudSearch.AddNewFriends(on: self, with: "")
///*
//        while (Time<5)||ResponseID == "......................" {
//            if Time==0{
//                LeanCloudSearch.GetUserID(UserEmail: self.Test.text!, completion:{(ServerID) in
//                    ResponseID=ServerID!
//                    print(ResponseID)
//                })
//                Time=Time+1
//            }else{
//                print(Date())
//                print(ResponseID)
//                sleep(1)
//                Time=Time+1
//
//            }
//            print(Time)
//        }
// */
////        print("End Loop")
////        let ViewToMove = UIView(frame: CGRect(x: 75, y: 75, width: 75, height: 75))
////        ViewToMove.backgroundColor=UIColor.black
////        view.addSubview(ViewToMove)
////
////        let startpoint=CGPoint(x: view.center.x, y: 0)
////        let endPoint=CGPoint(x: view.center.x, y:300)
////        let move=AnimationEffect.SpringAnimation(StartPoint: startpoint, EndPoint: endPoint, AnimationDuration: 3, AnimationDamping: 3)
////        TestImage.layer.add(move, forKey: "Position")
////        let Rotation=AnimationEffect.ConstructRotationAnimation(AnimationDuration: 2.7, AnimationRepeatCount: 1)
////        TestLabel.layer.add(Rotation, forKey: "Rotation")
////
////
////       SupportFunction.iPhoneViBrate()
////
//// //      AnimationEffect.Shake(with: Test)
////view.MakeRotateBallLoading(Title: "Loading", Enable: false)
////        //       AnimationEffect.LineOf3DLoadingView(on: self, with: true)
//////+++++++++++++++++++++++++++++++++++++++++
////  view.isUserInteractionEnabled=false
//////+++++++++++++++++++++++++++++++++++++++++
////        SupportFunction.delay(by: 5) {
////            print("Remove animation")
////            self.view.isUserInteractionEnabled=true
////            self.view.DismissBallRotationLoading()
//// ///           AnimationEffect.LineOf3DLoadingView(on: self, with: false)
//
//    }
//
//    func LoadingFriendDetail(){
//        let SearchUserView = SearchFriendsViewController()
//        let NewFriendsID = SearchUserView.PassSupChatsIDToNewFriendsView
//        let UserDetail = AVQuery(className: "UserLoginDetail")
//        UserDetail.whereKey("UserID", equalTo: NewFriendsID)
//        UserDetail.getFirstObjectInBackground { (ServerUsername, error) in
//            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//                //                completion(error.localizedDescription)
//            }
//            if let ServerUsername=ServerUsername,let Name=ServerUsername["Username"] as? String{
//                print(Name)
//            }
//        }
//        UserDetail.getFirstObjectInBackground{(ServerSupChatsID,error) in
//            if let error=error{print("Can't Find UserID 未找到用户ID",error.localizedDescription)
//                //                completion(error.localizedDescription)
//            }
//            if let ServerSupChatsID=ServerSupChatsID,let SupChatsID=ServerSupChatsID["SupChatsID"] as? String{
//                print(SupChatsID)
//            }
//        }
//        UserDetail.getFirstObjectInBackground{(ServerUserRegion,error) in
//            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//                //                completion(error.localizedDescription)
//            }
//            if let ServerUserRegion=ServerUserRegion,let Region=ServerUserRegion["Region"] as? String{
//                print(Region)}
//        }
//        UserDetail.getFirstObjectInBackground{(ServerUserProtrait,error) in
//            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//            }
//            if let ServerUsername=ServerUserProtrait,let Protrait=ServerUserProtrait!["Protrait"] as? Data{
//                print("Get Protrait")}
//        }
//
//
//
//    }
//    func LoadingAnimation(){
//        var LoadingView:UIView
//
//        //Creat a Loading wait View
//        let ReplicatorLayer=CAReplicatorLayer()
//        ReplicatorLayer.bounds=CGRect(x: 0, y: 0, width: 100, height: 100)
//        ReplicatorLayer.cornerRadius=20
//        ReplicatorLayer.position=self.view.center
//        ReplicatorLayer.backgroundColor=UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2).cgColor
//        ReplicatorLayer.instanceDelay=1/3
//        view.layer.addSublayer(ReplicatorLayer)
//
//        //Add Dot in the ReLicatorLayer
//        let Dotlayer=CALayer()
//        Dotlayer.bounds=CGRect(x: 0, y: 0, width: 15, height: 15)
//        Dotlayer.position=CGPoint(x: 15, y: ReplicatorLayer.frame.size.height/2)
//        Dotlayer.backgroundColor=UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.6).cgColor
//        Dotlayer.cornerRadius=7.5
//        ReplicatorLayer.addSublayer(Dotlayer)
//        //Setting the number of Dot in the Loading View
//        ReplicatorLayer.instanceCount=3
//        //Setting other dot in the Loading View By Transiform of direction X,Y,Z
//        ReplicatorLayer.instanceTransform=CATransform3DMakeTranslation(ReplicatorLayer.frame.size.width/3, 0, 0)
//
//        //Example of make a circle
////        CGFloat count                     =  10.0;
////        replicatorLayer.instanceCount     = count;
////        CGFloat angel                     = 2* M_PI/count;
////        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
//
//        //Add Animation into Dot
//        let DotAnimation=AnimationEffect.ConstructScaleAnimation(StartScale: 1, EndScale: 0, AnimationDuration: 1, Autoreverses: true, AnimationRepeatCount: kCFNumberPositiveInfinity as! Double)
//        Dotlayer.add(DotAnimation, forKey: nil)
//
//
//
//
//    }
//
//
////        print("开始task1\(Date())")
///*                LeanCloudSearch.GetUserID(UserEmail: self.Test.text!, completion: {(ServerID) in
//                   if ServerID == "The operation couldn’t be completed. no results matched the query"{
//
//                        print("+++++++++++++返回值\(ServerID)-------结束")
//                    }else{
//                        print("+++++++++++++返回值\(ServerID)-------结束")
//                    }
//                    ResponseID=ServerID!
//                    print(ServerID)
//                })
//        var time:Int=0
//       while ((ResponseID.contains("The operation couldn’t be completed. no results matched the query")==false)||(ResponseID.contains("_")==false))||ResponseID != "" {
//            let LoopValue=ResponseID
//            print(LoopValue)
//            print(LoopValue.contains("The operation couldn’t be completed. no results matched the query"))
//            print(LoopValue.contains("_"))
//            sleep(1)
//            time=time+1
//            print("Repeat time\(Date())")
//            if LoopValue=="The operation couldn’t be completed. no results matched the query"{
//                ID=false
//                print("h结束task1\(Date())")
//                break
//            }else if LoopValue.contains("_"){
//                ID=true
//                print("h结束task1\(Date())")
//                break
//            }else if LoopValue==""{
//                print("h结束task1\(Date())")
//                break
//            }
//            continue
//        }
//*/
//
//
//
//
//
//
//
//
//    var friends=[FriendsInformation]()
////
////    override func viewDidLoad() {
////        print("=============================")
////        super.viewDidLoad()
////        let appDelegate=UIApplication.shared.delegate as! AppDelegate
////        let FriendsmanagedContext=appDelegate.persistentContainer.viewContext
////        let FriendsFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendsInformation")
////        for Friends in friends{
////            print(Friends.usercostomername)
////        }
////        // Do any additional setup after loading the view.
////    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//
