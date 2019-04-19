//
//  LaunchScreenViewController.swift
//  SupChats
//
//  Created by QJY on 2019/2/19.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var LogoLabel: UILabel!
    
    func SettingLayout(){
        LogoLabel.isHidden=false
        LogoLabel.text="SupChats"
        LogoLabel.backgroundColor=UIColor.red
        LogoLabel.textColor=UIColor.init(red: 107, green: 208, blue: 255, alpha: 1)
        LogoLabel.layer.cornerRadius=30
        let startpoint=CGPoint(x: view.center.x, y: 0)
        let endpoint=CGPoint(x: view.center.x, y: view.center.y)
        let SpringAnimation=AnimationEffect.SpringAnimation(StartPoint: startpoint, EndPoint: endpoint, AnimationDuration: 3, AnimationDamping: 3)
        LogoLabel.layer.add(SpringAnimation, forKey: "SpringAnimaiton")
        LogoLabel.layer.position=endpoint
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LogoLabel.isHidden=true
        SettingLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    

    func InitialView(){
        if (UserDefaults.standard.object(forKey: "DFSUserID")as? String == nil)||(UserDefaults.standard.object(forKey: "DFSUsername")as? String == nil)||(UserDefaults.standard.object(forKey: "DFSPassword")as? String == nil){
            self.present(self.storyboard?.instantiateViewController(withIdentifier: "LoginNavigationControllerID")as! UIViewController, animated: true, completion: nil)
            print("Jump to Login Regsition View")
        }else{
            self.present(self.storyboard?.instantiateViewController(withIdentifier: "LoginNavigationControllerID")as! UIViewController, animated: true, completion: nil)
            print("Jump to MainViewController")
        }
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
 

}
