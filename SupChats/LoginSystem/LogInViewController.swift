//
//  LogInViewController.swift
//  SupChats
//
//  Created by QJY on 2019/4/9.
//  Copyright © 2019 QJY. All rights reserved.
//


import UIKit
import LeanCloud
import ChatKit
import AVOSCloudIM



class LogInViewController: UIViewController {
    //Account Text Field Action
    @IBOutlet weak var AccountID: UITextField!
    @IBAction func AccountIDActionStart(_ sender: UITextField){
        AccountID.layer.shadowOpacity=0.5
    }
    @IBAction func AccountIDActionEnd(_ sender: UITextField) {
        SupportFunction.CheckTextFiled(with: AccountID)
    }
    
    //Password Text Field Action
    @IBOutlet weak var Password: UITextField!
    @IBAction func PasswordActionStart(_ sender: UITextField) {
        Password.layer.shadowOpacity=0.5
    }
    @IBAction func PasswordActionEnd(_ sender: UITextField) {
        SupportFunction.CheckTextFiled(with: Password)
    }
    
    //Log In Button Action
    @IBOutlet weak var LogInBTN: UIButton!
    //Check Login Information
    var CheckName:Bool=false
    var CheckPassword:Bool=false
    @IBAction func LogIn(_ sender: UIButton) {
        print("Cick Login...点击登录2")
        view.MakeRotateBallLoading(Title: "LogIn", Enable: false)
        if (AccountID.text != "")&&(Password.text != ""){
            ClearDefaultsValue()
            FindLeanCloudUserDetail()
        }else{
            SupportFunction.ShowNoticeAlert(on: self, with: "Error AccountID", Message: "Please check you Email/SupChatsID and try again.")
        }
        
        //        SupportFunction.delay(by:3){
        //            if (self.CheckPassword==true) && (self.CheckName==true){
        //                self.LeanCloudExtraUserdetail()
        //
        //                self.present(self.storyboard?.instantiateViewController(withIdentifier: "MainTarBarControllerID")as! UIViewController, animated: true, completion: nil)
        //            }else{
        //                //  Remove Animation
        //                self.view.DismissBallRotationLoading()
        //                SupportFunction.ShowNoticeAlert(on: self, with: "LogIn Error", Message: "Please check AccoutID and Passowrd, and try again.")
        //            }
        //        }
    }
    
    var LocalSupChatsID:String=""       //Save SupChatsID in this view
    func FindLeanCloudUserDetail(){
        print("开始时间\(Date())")
        //  Determine the accountID is Email Format or SupChatsID Format
        if (AccountID.text?.contains("@"))==true{
            LeanCloudSearch.GetSupChatsID(UserEmail: AccountID.text!, completion: {(ServerSupchatsID) in
                self.LocalSupChatsID=ServerSupchatsID!
                if self.LocalSupChatsID != ""{
                    print("+++++++++++++++++\(self.LocalSupChatsID)")
                    self.LocalSupChatsID=ServerSupchatsID!
                    UserDefaults.standard.set(self.LocalSupChatsID, forKey: "DFSUsername")
                    self.CheckName=true
                    //   Try to Login to system
                    self.AVUserLogin()
                }else{
                    
                    print("Can't Find User Name in Server 未找到此用户名")
                    //  Remove Animation
                    self.view.DismissBallRotationLoading()
                    self.navigationController?.pushViewController(self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewControllerID")as! UIViewController, animated: true)
                    self.CheckName=false
                }
                // End Get SupchatsID
                print("得到SupChatsID\(self.LocalSupChatsID)")
            })
        }else if (AccountID.text?.contains("_"))==true{
            LocalSupChatsID=AccountID.text!
            //   Try to Login to system
            SupportFunction.delay(by: 3) {
                self.AVUserLogin()
                
            }
        }else{
            //  Remove Animation
            self.view.DismissBallRotationLoading()
            //  Notice User
            SupportFunction.ShowNoticeAlert(on: self, with: "Error AccountID", Message: "Please check you Email/SupChatsID and try again.")
        }
    }
    
    func AVUserLogin() {
        AVUser.logInWithUsername(inBackground: LocalSupChatsID , password: Password.text!){(user,error)-> Void in
            if (user != nil){
                print("Login Succeeded...登录成功")
                self.LeanCloudGetAllDetail()
                //self.LeanCloudExtraUserdetail()
                self.present(self.storyboard?.instantiateViewController(withIdentifier: "MainTarBarControllerID")as! UIViewController, animated: true, completion: nil)
            }else{
                print("Login Failed....登录失败")
                //  Remove Animation
                self.view.DismissBallRotationLoading()
                //  Notice to user
                SupportFunction.ShowNoticeAlert(on: self, with: "Login Error", Message: "Please check you Email/Password, Try again later")
            }
        }
        
    }
    
    func SharedInstance(){
        let UserSharedInstance=LCChatKit.sharedInstance()

        
//        [[LCChatKit() sharedInstance] setFetchProfilesBlock:^(NSArray<NSString *> *userIds, LCCKFetchProfilesCompletionHandler completionHandler) {
//            if (userIds.count == 0) {
//            return;
//            }
//            NSMutableArray *users = [NSMutableArray arrayWithCapacity:userIds.count];
//            for (NSString *clientId in userIds) {
//            //查询 _User 表需开启 find 权限
//            AVQuery *userQuery = [AVQuery queryWithClassName:@"_User"];
//            AVObject *user = [userQuery getObjectWithId:clientId];
//            if (user) {
//            //"avatar" 是 _User 表的头像字段
//            AVFile *file = [user objectForKey:@"avatar"];
//            LCCKUser *user_ = [LCCKUser userWithUserId:user.objectId name:[user objectForKey:@"username"] avatarURL:[NSURL URLWithString:file.url] clientId:clientId];
//            [users addObject:user_];
//            }else{
//            //注意：如果网络请求失败，请至少提供 ClientId！
//            LCCKUser *user_ = [LCCKUser userWithClientId:clientId];
//            [users addObject:user_];
//            }
//            }
//            !completionHandler ?: completionHandler([users copy], nil);
//            }];
    }
    
    func LeanCloudGetAllDetail(){
        LeanCloudSearch.GetUserAllDetailBySupChats(SupChatsID: LocalSupChatsID) { (Details) in
            for Detail in Details!{
                
                let DetailobjectID=(Detail as AnyObject).object(forKey: "objectId") as! String
                let DetailAVUser=(Detail as AnyObject).object(forKey: "AVUserID") as! String
                let DetailPassword=(Detail as AnyObject).object(forKey: "Password") as! String
                let DetailEmail=(Detail as AnyObject).object(forKey: "Email") as! String
                let DetailRegion=(Detail as AnyObject).object(forKey: "Region") as! String
                let DetailSupChatsID=(Detail as AnyObject).object(forKey: "SupChatsID") as! String
                let DetailUsername=(Detail as AnyObject).object(forKey: "Username") as! String
                let DetailProtrait=(Detail as AnyObject).object(forKey: "Protrait") as? AVFile
                DetailProtrait?.getDataInBackground({(data:Data?,error:Error?) in
                    
                    UserDefaults.standard.set(data,forKey:"DFSProtrait")
                })
                print("本地信息获取：")
                print(DetailobjectID)
                print(DetailAVUser)
                print(DetailPassword)
                print(DetailEmail)
                print(DetailRegion)
                print(DetailSupChatsID)
                print(DetailUsername)
                //                let DetailRegion=(Detail as AnyObject).object(forKey: "Region") as! String
                //                let DetailSupChatsID=(Detail as AnyObject).object(forKey: "SupChatsID") as! String
                UserDefaults.standard.set(DetailobjectID,forKey:"DFSUserDetailID")
                UserDefaults.standard.set(DetailUsername,forKey:"DFSUsername")
                UserDefaults.standard.set(DetailEmail,forKey:"DFSEmail")
                UserDefaults.standard.set(DetailPassword,forKey:"DFSPassword")
                UserDefaults.standard.set(DetailRegion,forKey:"DFSRegion")
                UserDefaults.standard.set(DetailSupChatsID,forKey:"DFSSupChatsID")
                UserDefaults.standard.set(DetailAVUser,forKey:"DFSAVUserID")
                UserDefaults.standard.synchronize()
                
            }
        }
    }
    
    func LeanCloudExtraUserdetail(){
        LeanCloudSearch.GetAVUserIDBySupChatsID(SupChatsID: LocalSupChatsID, completion: {(ServerUserID) in
            if ServerUserID != nil{
                print("服务器中ServerID\(ServerUserID!)")
                UserDefaults.standard.set(ServerUserID!, forKey: "DFSAVUserID")
            }else{
                print("Can't Find User ID in Server 未找到此用户ID")
            }
        })
        LeanCloudSearch.GetUserNameBySupChatsID(SupChatsID:LocalSupChatsID, completion: {(ServerUsername)in
            if ServerUsername != nil{
                print("服务器中Username\(ServerUsername!)")
                UserDefaults.standard.set(ServerUsername!, forKey: "DFSUsername")
            }else{
                print("Can't Find UserName in Server 未找到此用户名字")
            }
        })
        LeanCloudSearch.GetUserRegionBySupChatsID(SupChatsID:LocalSupChatsID, completion: {(ServerRegion)in
            if ServerRegion != nil{
                print("服务器中Username\(ServerRegion!)")
                UserDefaults.standard.set(ServerRegion!, forKey: "DFSRegion")
            }else{
                print("Can't Find User Region in Server 未找到此用户地区")
            }
        })
        
        LeanCloudSearch.GetUserDetailIDBySupChatsID(SupChatsID:LocalSupChatsID, completion: {(ServerUserDetailID)in
            if ServerUserDetailID != nil{
                print("服务器中Username\(ServerUserDetailID!)")
                UserDefaults.standard.set(ServerUserDetailID!, forKey: "DFSUserDetailID")
            }else{
                print("Can't Find USerName in Server 未找到此用户名字")
            }
        })
        //        LeanCloudSearch.GetUserNameBySupChatsID(SupChatsID:LocalSupChatsID, completion: {(ServerUsername)in
        //            if ServerUsername != nil{
        //                UserDefaults.standard.set(ServerUsername, forKey: "DFSUSerName")
        //            }else{
        //                print("Can't Find USerName in Server 未找到此用户名字")
        //            }
        //        })
        
        
    }
    
    
    @IBAction func BackBTN(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var ResetPassword: UIButton!
    @IBAction func ResetPasswordActive(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewControllerID")as! UIViewController, animated: true)
        print("Click Reset Password BTN...点击重置密码")
    }
    
    
    //    //LeanCloud ChatKit ClientID
    //      func LeanCloudClient(){
    //        LCChatKit.sharedInstance()
    //    }
    
    func ClearDefaultsValue() {
        UserDefaults.standard.removeObject(forKey:"DFSUserDetailID")
        UserDefaults.standard.removeObject(forKey:"DFSUsername")
        UserDefaults.standard.removeObject(forKey:"DFSEmail")
        UserDefaults.standard.removeObject(forKey:"DFSPassword")
        UserDefaults.standard.removeObject(forKey:"DFSPortrait")
        UserDefaults.standard.removeObject(forKey:"DFSRegion")
        UserDefaults.standard.removeObject(forKey:"DFSProtrait")
        UserDefaults.standard.removeObject(forKey:"DFSSupChatsID")
        UserDefaults.standard.removeObject(forKey:"DFSAVUserID")
    }
    
    func LogInViewLayout(){
        AccountID.layer.cornerRadius=10
        Password.layer.cornerRadius=10
        Password.isSecureTextEntry=true
        LogInBTN.layer.cornerRadius=25
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidAppear(true)
        LogInViewLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("加载LoginCView")
        LogInViewLayout()
        configureTapGesture()
        // Do any additional setup after loading the view.
    }
    
    private func configureTapGesture(){
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(LogInViewController.HandleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func HandleTap(){
        print("Handle Tap was called")
        view.endEditing(true)
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
