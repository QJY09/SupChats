//
//  ResetPasswordViewController.swift
//  SupChats
//
//  Created by QJY on 2019/2/2.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    //AccountID Text Field
    @IBOutlet weak var AccountID: UITextField!
    @IBAction func AccountIDActionStart(_ sender: UITextField) {
        AccountID.layer.shadowOpacity=0.5
    }
    @IBAction func AccountIDActionEnd(_ sender: UITextField) {
        SupportFunction.CheckEmailTextFiled(with: AccountID)
    }
    //BackLogin
    @IBAction func BackLoginActive(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var ResetPassword: UIButton!
    @IBAction func ResetPasswordAction(_ sender: UIButton) {
        //  Add Animation
        self.view.MakeRotateBallLoading(Title: "Loading", Enable: false)
        print("Click the Reset Password Button...点击重置密码")
        
        let CheckAccountID = SupportFunction.CheckEmailTextFiled(with: AccountID)as! Bool
        if CheckAccountID==true{
            //  Add Animation
            self.view.MakeRotateBallLoading(Title: "Please Check Email", Enable: false)
            //  Delay few second, then run the code
            SupportFunction.delay(by: 3){
                //  Remove Animation
                self.view.DismissBallRotationLoading()
            }
            print("Succceed")
        }else{
            //  Remove Animation
            self.view.DismissBallRotationLoading()
            SupportFunction.WarningTextField(with: AccountID)
        }
 /*
        LeanCloudSearch.GetUserName(UserEmail: AccountID.text!, completion: {(ServerUserName) in
            if ServerUserName != nil{
                AVUser.requestPasswordResetForEmail(inBackground: self.AccountID.text!){(succeeded,error) -> Void in
                    if succeeded{
                        SupportFunction.ShowNoticeAlert(on: self, with: "Check Email", Message: "We already send Reset Password Email to you. Please Check your email.")
                        print("Send Reset Email Succeeded")
                    }else{
                         SupportFunction.ShowNoticeAlert(on: self, with: "Fail Check Email", Message: "We can't send email to you,please try agina.")
                        print("Send Reset Email Failed")
                    }
                }
            }else{
                print("Try other Email Address...尝试更换邮箱")

            }
        })
*/
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapGesture()

        // Do any additional setup after loading the view.
    }
    
    
    private func configureTapGesture(){
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(ResetPasswordViewController.HandleTap))
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
