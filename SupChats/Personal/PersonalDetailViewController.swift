//
//  PersonalDetailViewController.swift
//  SupChats
//
//  Created by QJY on 2019/2/26.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit


class PersonalDetailViewController: UIViewController {
    //Profile
    @IBOutlet weak var ProfileStackView: UIStackView!
    @IBOutlet weak var ProfileView: UIView!
    @IBOutlet weak var ProfileLabel: UILabel!
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var ProfilePushToRight: UIImageView!
    @IBOutlet weak var ProfileViewBTN: UIButton!
    @IBAction func ProfileViewActive(_ sender: UIButton) {
        UploadImageFromdevice()
    }
    
    var ChooseImage:UIImage!
    fileprivate func UploadImageFromdevice(){
        let actionSheet = UIAlertController(title: "Upload Portrait", message: nil, preferredStyle: .actionSheet)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        //拍照控件
        let takePhotos = UIAlertAction(title: "Take photo", style: .destructive, handler: {
            (action: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                picker.allowsEditing = true
                self.present(picker, animated: true, completion: nil)
            }else{print("模拟其中无法打开照相机,请在真机中使用")}
        })
        //从图库中选取照片
        let selectPhotos = UIAlertAction(title: "Select From Photo Library", style: .default, handler: {
            (action:UIAlertAction)
            -> Void in
            let PortraitPickerContraller=UIImagePickerController()
            PortraitPickerContraller.allowsEditing=true
            PortraitPickerContraller.delegate=self
            PortraitPickerContraller.sourceType = .photoLibrary
            self.present(PortraitPickerContraller, animated: true, completion:nil)
        })
        actionSheet.addAction(cancelBtn)
        actionSheet.addAction(takePhotos)
        actionSheet.addAction(selectPhotos)
        self.present(actionSheet, animated: true, completion: nil)
    }
    


        
    
    
    //Nickname
    @IBOutlet weak var NicknameStackView: UIStackView!
    @IBOutlet weak var NicknameView: UIView!
    @IBOutlet weak var NicknameLabel: UILabel!
    @IBOutlet weak var NicknameUserLabel: UILabel!
    @IBOutlet weak var NicknamePushToRight: UIImageView!
    @IBOutlet weak var NicknameViewBTN: UIButton!
    @IBAction func NicknameViewActive(_ sender: UIButton) {
       navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "SettingUsernameViewControllerID")as! UIViewController, animated: true)
    }
    
    //SupChatsID
    @IBOutlet weak var SupChatsIDStackView: UIStackView!
    @IBOutlet weak var SupChatsIDView: UIView!
    @IBOutlet weak var SupChatsIDLabel: UILabel!
    @IBOutlet weak var SupChatsIDUserLabel: UILabel!
    
    //QRID
    @IBOutlet weak var QRIDStackView: UIStackView!
    @IBOutlet weak var QRIDView: UIView!
    @IBOutlet weak var QRIDLabel: UILabel!
    @IBOutlet weak var QRIDImageView: UIImageView!
    @IBOutlet weak var QRIDPushToRight: UIImageView!
    @IBOutlet weak var QRIDViewBTN: UIButton!
    @IBAction func QRIDViewActive(_ sender: UIButton) {
        
    }
    


    //Gender
    @IBOutlet weak var GenderStackView: UIStackView!
    @IBOutlet weak var GenderView: UIView!
    @IBOutlet weak var GenderImageView: UIImageView!
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var GenderUserLabel: UILabel!
    @IBOutlet weak var GenderPushToRight: UIImageView!
    @IBOutlet weak var GenderViewBTN: UIButton!
    @IBAction func GenderViewActive(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "SettingGenderViewControllerID")as! UIViewController, animated: true)

    }

    
    //Region
    @IBOutlet weak var RegionStackView: UIStackView!
    @IBOutlet weak var RegionView: UIView!
    @IBOutlet weak var RegionLabel: UILabel!
    @IBOutlet weak var RegionUserLabel: UILabel!
    @IBOutlet weak var RegionPushToRight: UIImageView!
    @IBOutlet weak var RegionViewBTN: UIButton!
    @IBAction func RegionViewActive(_ sender: UIButton) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "SettingRegionViewControllerID")as! UIViewController, animated: true)
    }
    
    //Signature
    @IBOutlet weak var SignatureStackView: UIStackView!
    @IBOutlet weak var SignatureView: UIView!
    @IBOutlet weak var SignatureLabel: UILabel!
    @IBOutlet weak var SignatureUserLabel: UILabel!
    @IBOutlet weak var SignaturePushToRight: UIImageView!
    @IBOutlet weak var SignatureViewBTN: UIButton!
    @IBAction func SignatureViewActive(_ sender: UIButton) {
        print("Click Signature Cell")
    }
    
    
    
    func PersonalDetailViewLayout(){
        title="Personal Detail"
        tabBarController?.hidesBottomBarWhenPushed=true

        if UserDefaults.standard.string(forKey: "DFSUsername") == nil {
            NicknameUserLabel.text! = "nil"
        }else{
            NicknameUserLabel.text=UserDefaults.standard.string(forKey: "DFSUsername")!
        }
        if UserDefaults.standard.string(forKey: "DFSSupChatsID") == nil {
            SupChatsIDUserLabel.text! = "nil"
        }else{
            SupChatsIDUserLabel.text=UserDefaults.standard.string(forKey: "DFSSupChatsID")!
        }
        if UserDefaults.standard.string(forKey: "DFSUserGender") == nil {
            GenderUserLabel.text! = "nil"
        }else{
            GenderUserLabel.text=UserDefaults.standard.string(forKey: "DFSUserGender")!
            if GenderUserLabel.text=="Man"{
                GenderImageView.image=UIImage.init(named: "Man")
            }else if GenderUserLabel.text=="Women"{
                GenderImageView.image=UIImage.init(named: "Women")
            }else{
             GenderImageView.isHidden=true
            }
        }
        if UserDefaults.standard.string(forKey: "DFSRegion") == nil {
            RegionUserLabel.text! = "nil"
        }else{
            RegionUserLabel.text=UserDefaults.standard.string(forKey: "DFSRegion")!
        }
        if UserDefaults.standard.string(forKey: "DFSSignature") == nil {
            GenderUserLabel.text! = "nil"
        }else{
            GenderUserLabel.text=UserDefaults.standard.string(forKey: "DFSSignature")!
        }
        if UserDefaults.standard.data(forKey: "DFSPortrait") == nil{
            ProfileImageView.image=UIImage.init(imageLiteralResourceName: "InitialProtrait")
        }else{
            ProfileImageView.image=UIImage.init(data: UserDefaults.standard.data(forKey: "DFSPortrait")!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonalDetailViewLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        PersonalDetailViewLayout()
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
extension PersonalDetailViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let SelectImage = info[UIImagePickerControllerEditedImage]as? UIImage{
            ProfileImageView.image=SelectImage
            ChooseImage=SelectImage
        }
        UserDefaults.standard.removeObject(forKey: "DFLPortrait")
        UserDefaults.standard.set(UIImagePNGRepresentation(ChooseImage) as! NSData, forKey: "DFLPortrait")
        print("图片路径\(UserDefaults.standard.object(forKey: "DFRPortrait"))")
        picker.dismiss(animated: true, completion: nil)
    }
}

