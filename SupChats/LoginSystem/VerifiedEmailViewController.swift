//
//  VerifiedEmailViewController.swift
//  SupChats
//
//  Created by QJY on 2019/1/31.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit


class VerifiedEmailViewController: UIViewController {
    @IBOutlet weak var BackBTN: UIButton!
    @IBAction func BackToRegisterView(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        print("Back to Register View...返回注册界面")
    }
    @IBOutlet weak var EnterMianViewBTN: UIButton!
    @IBAction func EnterMainView(_ sender: Any) {
        //  Add Animation
        view.MakeRotateBallLoading(Title: "Chacking Email", Enable: false)
        let UserSupChatsID = UserDefaults.standard.value(forKey: "DFRSupChatsID")
        let UserPassword = UserDefaults.standard.value(forKey: "DFRPassword")
        print("用户名\(UserSupChatsID) 密码\(UserPassword)")
        
        //  Login to system
        AVUser.logInWithUsername(inBackground: UserSupChatsID as! String, password: UserPassword as! String){(user,error)-> Void in
            if (user != nil){
              print("Login Succeeded...登录成功")
                self.UserDefaultsSetting()
               self.present(self.storyboard?.instantiateViewController(withIdentifier: "MainTarBarControllerID")as! UIViewController, animated: true, completion: nil)
            }else{print("Login Failed....登录失败")
                //  Remove Animation
                self.view.DismissBallRotationLoading()
                //  Notice to user
                SupportFunction.ShowNoticeAlert(on: self, with: "Login Error", Message: "Please check you Email/Password, Try again later")
                let Action=UIAlertAction(title: "BTN", style: .default, handler: nil)
            }
        }
    }
    
    
    func UserDefaultsSetting(){
        UserDefaults.standard.set(UserDefaults.standard.object(forKey: "DFRUserName"), forKey: "DFSUsername")
        UserDefaults.standard.set(UserDefaults.standard.object(forKey: "DFREmail"), forKey: "DFSEmail")
        UserDefaults.standard.set(UserDefaults.standard.object(forKey: "DFRSupChatsID"), forKey: "DFSSupChatsID")
        UserDefaults.standard.set(UserDefaults.standard.object(forKey: "DFRPassword"), forKey: "DFSPassword")
        UserDefaults.standard.set(UserDefaults.standard.object(forKey: "DFRPortrait"), forKey: "DFSPortrait")
        UserDefaults.standard.set(UserDefaults.standard.object(forKey: "DFRRegion"), forKey: "DFSRegion")
        UserDefaults.standard.set(UserDefaults.standard.object(forKey: "DFRProtrait"), forKey: "DFSProtrait")
        UserDefaults.standard.set( UserDefaults.standard.object(forKey: "DFRAVUserID"), forKey: "DFSAVUser")
        UserDefaults.standard.removeObject(forKey:"DFRUserName")
        UserDefaults.standard.removeObject(forKey:"DFREmail")
        UserDefaults.standard.removeObject(forKey:"DFRPassword")
        UserDefaults.standard.removeObject(forKey:"DFRPortrait")
        UserDefaults.standard.removeObject(forKey:"DFRRegion")
        UserDefaults.standard.removeObject(forKey:"DFRSupChatsID")
        UserDefaults.standard.removeObject(forKey: "DFRAVUserID")
    }

    @IBAction func ResendVerifyEmail(_ sender: UIButton) {
        LeanCloudSearch.SendVerifyEmail(on: self, with: UserDefaults.standard.object(forKey: "DFREmail")as! String)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       let UserNickname = UserDefaults.value(forKey: "DFRUsername") as! String
 //       let UserPassword = UserDefaults.value(forKey: "DFRPassword") as! String
 //       print("用户名\(UserNickname)密码\(UserPassword)")
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
