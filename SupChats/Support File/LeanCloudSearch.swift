//
//  LeanCloudSearch.swift
//  SupChats
//
//  Created by QJY on 2019/2/1.
//  Copyright © 2019 QJY. All rights reserved.
//

import AVOSCloud
import LeanCloud
import UIKit

struct LeanCloudSearch {

}
extension LeanCloudSearch{
    
    //  Start Chats With New Friends
    static func CreatChatWithNewFriends(on ViewController:UIViewController,AVUserID:String,Username:String){
        let ChatKit=LCChatKit.sharedInstance().client
        ChatKit?.createConversation(withName: Username, clientIds: [AVUserID], callback: { (Conversation, Error) in
            Conversation?.send("Hello \(Username)" as! AVIMMessage, option: nil, callback: { (SucceedBool, Error) in
                if (SucceedBool){
                    LCChatKit.sharedInstance()?.insertRecentConversation(Conversation)
                }else{print("开始与好友聊天错误并转跳\(Error)")}
            })
        })
    }
    
    //  Start Chats With New Friends, then Jump to Conversation View
    static func CreatChatWithFriendAndJumpToConversationView(on ViewController:UIViewController,AVUserID:String,Username:String,completion: @escaping(String?) -> Void){
        let ChatKit=LCChatKit.sharedInstance().client
        ChatKit?.createConversation(withName: Username, clientIds: [AVUserID], callback: { (Conversation, Error) in
            Conversation?.send("Hello \(Username)" as! AVIMMessage, option: nil, callback: { (SucceedBool, Error) in
                if (SucceedBool){
                    print("即将转跳到聊天界面-- The view will jump to Conversation View Controller\(SucceedBool)")
                    let ConversationViewController=LCCKConversationViewController(conversationId: Conversation?.conversationId) as! UIViewController
                    ViewController.navigationController?.pushViewController(ConversationViewController, animated: true)
                }else{print("开始与好友聊天错误\(Error)")}
            })
        })

    }
    
    //从服务器发送新邮件的验证
    static func SendVerifyEmail(on ViewController:UIViewController,with Email:String){
        AVUser.requestEmailVerify(Email){(succeed,error) in
            if succeed{
                print("Send Verfiy Email Succeed...发送邮箱验证码成功")
            }else{
                SupportFunction.ShowNoticeAlert(on: ViewController, with: "Failed send verification Email", Message: "Request Verify Email had error, Please check notwork and try again")
                print("Send Verfiy Email Error...发送邮箱验证码失败")}
        }
    }
    
    //添加好友 Add Friends at Current AVUSerID
    static func AddNewFriends(on ViewController:UIViewController,with AVUserID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVUser.current()
        UserDetail?.follow(AVUserID){(Succeed,Error) in
            if let Error=Error{
                SupportFunction.ShowNoticeAlert(on: ViewController, with: "Failed to add Friend", Message: "Add friends error, Please check notwork and try again")
                print("Can‘ add new friends",Error.localizedDescription)
                completion("false")
                //                completion(error.localizedDescription)
            }else{
                completion("\(Succeed)")
                print("Add Friend Succeed in LeanCloudSearch\(Succeed)")
            }
        }
    }
    
    //删除好友 Delete Friends at Current AVUserID
    static func DeleteNewFriends(on ViewController:UIViewController,with AVUserID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVUser.current()
        UserDetail?.unfollow(AVUserID){(Succeed,Error) in
            if let Error=Error{
                SupportFunction.ShowNoticeAlert(on: ViewController, with: "Failed to delete Friend", Message: "Delete friends error, Please check notwork and try again")
                print("Can‘ add new friends",Error.localizedDescription)
                completion("false")
                //                completion(error.localizedDescription)
            }else{
                print("Delete Friend Succeed")
                completion("\(Succeed)")
            }
        }
    }
    //通过Email服务器获取AVUserID
    static func GetAVUserID(UserEmail:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("Email", equalTo: UserEmail)
        UserDetail.getFirstObjectInBackground{(ServerAVUserID,error) in
            if let error=error{print("Can't Find UserID 未找到用户ID",error.localizedDescription)
//                completion("error.localizedDescription")
                completion("")
            }
            if let ServerAVUserID=ServerAVUserID,let UserID=ServerAVUserID["AVUserID"] as? String{
                completion(UserID)}
        }
    }
    
    //通过Email服务器获取SupchatsID
    static func GetSupChatsID(UserEmail:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("Email", equalTo: UserEmail)
        UserDetail.getFirstObjectInBackground{(ServerSupChatsID,error) in
            if let error=error{print("Can't Find UserID 未找到用户ID",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerSupChatsID=ServerSupChatsID,let SupChatsID=ServerSupChatsID["SupChatsID"] as? String{
                completion(SupChatsID)}
        }
    }
    
    
    
    //通过Email服务器获取UserName
    static func GetUserName(UserEmail:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("Email", equalTo: UserEmail)
        UserDetail.getFirstObjectInBackground{(ServerUsername,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
                //                completion(error.localizedDescription)
                completion("")
            }
            if let ServerUsername=ServerUsername,let Name=ServerUsername["Username"] as? String{
                completion(Name)}
        }
    }
    
    //通过Email服务器获取UserRegion
    static func GetUserRegion(UserEmail:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("Email", equalTo: UserEmail)
        UserDetail.getFirstObjectInBackground{(ServerUserRegion,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerUserRegion=ServerUserRegion,let Region=ServerUserRegion["Region"] as? String{
                completion(Region)}
        }
    }

    //通过Email服务器获取Protrait
    static func GetUserProtrait(UserEmail:String,completion: @escaping(Data?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("Email", equalTo: UserEmail)
        UserDetail.getFirstObjectInBackground{(ServerUserProtrait,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
            }
            if let ServerUsername=ServerUserProtrait,let Protrait=ServerUserProtrait!["Protrait"] as? Data{
                completion(Protrait)}
        }
    }
    
    //通过Email服务器获取Password
    static func GetUserPassword(UserEmail:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("Email", equalTo: UserEmail)
        UserDetail.getFirstObjectInBackground{(ServerPassword,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerPassword=ServerPassword,let Password=ServerPassword["Password"] as? String{
                completion(Password)}
        }
    }
    
    //通过ID在服务器获取Password
    static func GetUserPasswordByISupchatsID(SupChatsID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserDetail.getFirstObjectInBackground{(ServerPassword,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerPassword=ServerPassword,let Password=ServerPassword["Password"] as? String{
                completion(Password)}
        }
    }
    
    //通过ID服务器获取UserDetailID
    static func GetUserDetailIDBySupChatsID(SupChatsID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserDetail.getFirstObjectInBackground{(ServerUserDetailID,error) in
            if let error=error{print("Can't Find UserID 未找到用户ID",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerUserDetailID=ServerUserDetailID,let UserDetailID=ServerUserDetailID["objectId"] as? String{
                completion(UserDetailID)}
        }
    }
    
    //通过ID服务器获取AVUserID
    static func GetAVUserIDBySupChatsID(SupChatsID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserDetail.getFirstObjectInBackground{(ServerAVUserID,error) in
            if let error=error{print("Can't Find UserID 未找到用户ID",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerAVUserID=ServerAVUserID,let UserID=ServerAVUserID["AVUserID"] as? String{
                completion(UserID)}
        }
    }
    
    //通过ID服务器获取Email
    static func GetEmailBySupChatsID(SupChatsID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserDetail.getFirstObjectInBackground{(ServerEmail,error) in
            if let error=error{print("Can't Find UserID 未找到用户ID",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerEmail=ServerEmail,let Email=ServerEmail["Email"] as? String{
                completion(Email)}
        }
    }
    
    
    
    //通过ID服务器获取UserName
    static func GetUserNameBySupChatsID(SupChatsID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserDetail.getFirstObjectInBackground{(ServerUsername,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerUsername=ServerUsername,let Name=ServerUsername["Username"] as? String{
                completion(Name)}
        }
    }
    
    //通过ID服务器获取UserRegion
    static func GetUserRegionBySupChatsID(SupChatsID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserDetail.getFirstObjectInBackground{(ServerUserRegion,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerUserRegion=ServerUserRegion,let Region=ServerUserRegion["region"] as? String{
                completion(Region)}
        }
    }
    
    //通过ID服务器获取Protrait
    static func GetUserProtraitBySupChatsID(SupChatsID:String,completion: @escaping(Data?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserDetail.getFirstObjectInBackground{(ServerUserProtrait,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
            }
            if let ServerUsername=ServerUserProtrait,let Protrait=ServerUserProtrait!["Protrait"] as? Data{
                completion(Protrait)}
        }
    }
    
    //通过ID服务器获取Password
    //Get Password from server via SupChatsID
    static func GetUserPasswordBySupChatsID(SupChatsID:String,completion: @escaping(String?) -> Void){
        let UserDetail=AVQuery(className: "UserLoginDetail")
        UserDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserDetail.getFirstObjectInBackground{(ServerPassword,error) in
            if let error=error{print("Can't Find Username 未找到用户名称",error.localizedDescription)
//                completion(error.localizedDescription)
                completion("")
            }
            if let ServerPassword=ServerPassword,let Password=ServerPassword["Password"] as? String{
                completion(Password)}
        }
    }
    
    //Load User Information From SupChats
    static func GetUserAllDetailBySupChats(SupChatsID:String,completion: @escaping([Any]?) -> Void){
        let UserAllDetail=AVQuery(className: "UserLoginDetail")
        UserAllDetail.whereKey("SupChatsID", equalTo: SupChatsID)
        UserAllDetail.findObjectsInBackground { (DetailObject:[Any]?,error: Error?) in
            if error != nil{print("Can't Find Username 未找到用户名称",error!.localizedDescription)
                //                completion(error.localizedDescription)
            }else{
                completion(DetailObject)
            }
        }
    }
    
//    Example
//    LeanCloudSearch.GetUserAllDetailBySupChats(SupChatsID: "AAAA_qjy124") { (Details) in
//    for Detail in Details!{
//
//    let DetailobjectID=(Detail as AnyObject).object(forKey: "objectId") as! String
//    let DetailAVUser=(Detail as AnyObject).object(forKey: "AVUserID") as! String
//    let DetailPassword=(Detail as AnyObject).object(forKey: "Password") as! String
//    let DetailEmail=(Detail as AnyObject).object(forKey: "Email") as! String
//    let DetailRegion=(Detail as AnyObject).object(forKey: "Region") as! String
//    let DetailSupChatsID=(Detail as AnyObject).object(forKey: "SupChatsID") as! String
//    let DetailUsername=(Detail as AnyObject).object(forKey: "Username") as! String
//    //                let DetailRegion=(Detail as AnyObject).object(forKey: "Region") as! String
//    //                let DetailSupChatsID=(Detail as AnyObject).object(forKey: "SupChatsID") as! String
//    UserDefaults.standard.set(DetailobjectID,forKey:"DFSUserDetailID")
//    UserDefaults.standard.set(DetailUsername,forKey:"DFSUsername")
//    UserDefaults.standard.set(DetailEmail,forKey:"DFSEmail")
//    UserDefaults.standard.set(DetailPassword,forKey:"DFSPassword")
//    UserDefaults.standard.set(DetailRegion,forKey:"DFSRegion")
//    //                UserDefaults.standard.set(DetailUserDetailID,forKey:"DFSProtrait")
//    UserDefaults.standard.set(DetailSupChatsID,forKey:"DFSSupChatsID")
//    UserDefaults.standard.set(DetailAVUser,forKey:"DFSAVUserID")
//
//    }
//    }
    
    
    
}
