//
//  LogIn&RegisterViewController.swift
//  SupChats
//
//  Created by QJY on 2019/1/19.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class LogIn_RegisterViewController: UIViewController {

    @IBOutlet weak var LogIn: UIButton!
    @IBOutlet weak var Register: UIButton!
    
    @IBAction func LogInActive(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "LoginViewControllerID")as! UIViewController, animated: true)
    }
    @IBAction func RegisterAction(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "RegisterViewControllerID")as! UIViewController, animated: true)
        print("Click Register...点击注册1")
    }
    
    
    func LogInRegisterLayout() {
        LogIn.backgroundColor=UIColor.clear
        LogIn.layer.cornerRadius=20
        Register.backgroundColor=UIColor.clear
        Register.layer.cornerRadius=20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
          LogInRegisterLayout()
    }
    
/*    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
        }, completion: nil)
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
