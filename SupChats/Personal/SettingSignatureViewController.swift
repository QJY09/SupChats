//
//  SettingSignatureViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/4.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class SettingSignatureViewController: UIViewController {

    @IBOutlet weak var SignatureStackView: UIStackView!
    @IBOutlet weak var SignatureTextView: UITextView!
    @IBOutlet weak var SaveSignatureBTN: UIButton!
    @IBAction func SaveSignatureAction(_ sender: UIButton) {
        print("Save Signature In Server")
        UpdateUserDetail.UpdateSignatureWithCQL(with: SignatureTextView.text!, CloudObjectID: UserDefaults.standard.string(forKey: "DFSUserDetailID")!) { (Succeed) in
            if Succeed=="true"{
               UserDefaults.standard.set(self.SignatureTextView.text!,forKey: "DFSSignature")
            }
            print("Update User Signature\(Succeed) ")
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Setting Signature"
        SignatureTextView.text=UserDefaults.standard.string(forKey: "DFSSignature")
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
