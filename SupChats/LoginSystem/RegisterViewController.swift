//
//  RegisterViewController.swift
//  SupChats
//
//  Created by QJY on 2019/1/19.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

let RegionDataList = ["Andorra","Afghanistan","Aland Islands","Albania","Algeria","American Samoa","Angola","Anguilla","Antigua And Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia And Herzegovina","Botswana","Brazil","Brunei Darussalam","Bulgaria","BurkinaFaso","Burundi","Cambodia","Cameroon","Canada","CapeVerde","Caribbean Netherlands","Cayman Islands","Central African Republic","Chad","Chile","Colombia","Comoros","CostaRica","Cote DIvoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Democratic Republic Of The Congo","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","ElSalvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Faroe Islands","Federated States Of Micronesia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Guyanne Francaise","Haiti","Honduras","HongKong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Isle Of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar","Namibe”,”Nauru","Nepal","Netherlands","New Caledonia","NewZealand","Nicaragua","Niger","Nigeria","NorthKorea","NorthernMarianaIslands","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","China","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Republic Of Ireland","Republic Of The Congo","Reunion","Romania","Russia","Rwanda","Saint Barthelemy","SaintKittsAndNevis","SaintLucia","Saint Martin","Saint Pierre Et Miquelon","Saint Vincent And The Grenadines","Samoa","San Marino","Saoo Tome And Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Sint  Marteen","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea","South Soudan","Spain","SriLanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad And Tobago","Tunisia","Turkey","Turkmenistan","Turks And Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","VaticanCity","Venezuela","Vietnam","Virgin Islands","Virgin Islands British","Yemen","Zambia","Zimbabwe"]
class RegisterViewController: UIViewController,UITextFieldDelegate{
   
    
    //Nickname text Field Setting
    @IBOutlet weak var Nickname: UITextField!
    @IBAction func NicknameActionStart(_ sender: UITextField) {
        Nickname.layer.shadowOpacity=0.5
    }
    var CheckNickname:Bool = false
    @IBAction func NicknameActionEnd(_ sender: UITextField) {
      CheckNickname=SupportFunction.StringWithAlphanumericNumber(with: Nickname.text!)
        if CheckNickname==true{
            SupportFunction.CorrectTextField(with: Nickname)
        }else{SupportFunction.WarningTextField(with: Nickname)}
        print("NickName Check \(CheckNickname)")
    }
    
    //Email text Field Setting
    @IBOutlet weak var Email: UITextField!
    @IBAction func EmailActionStart(_ sender: UITextField) {
        Email.layer.shadowOpacity=0.5
    }
    var CheckEmail:Bool = false
    @IBAction func EmailActionEnd(_ sender: UITextField) {
        CheckEmail=SupportFunction.CheckEmailTextFiled(with: Email)
        print("Email Check \(CheckEmail)")
    }
    
    //Region text setting
    var CheckRegion:Bool=false
    @IBOutlet weak var Region: UITextField!
    func CreatRegionPicker() {
        let RegionPickerView=UIPickerView()
        RegionPickerView.delegate=self
        Region.inputView = RegionPickerView
        CreatToolbarForRegionPicker()
    }
    
    @objc func DissmissKeyboard(){
        view.endEditing(true)
    }
    
    func CreatToolbarForRegionPicker() {
        let RegionPickerToolbar=UIToolbar()
        RegionPickerToolbar.sizeToFit()
        let DoneBTN = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(RegisterViewController.DissmissKeyboard))
        RegionPickerToolbar.setItems([DoneBTN], animated: true)
        RegionPickerToolbar.isUserInteractionEnabled=true
        Region.inputAccessoryView=RegionPickerToolbar
    }

    
    //Password text field setting
    @IBOutlet weak var Password: UITextField!
    @IBAction func PasswordActionStart(_ sender: UITextField) {
        Password.layer.shadowOpacity=0.5
    }
    var CheckPassword:Bool = false
    @IBAction func PasswordActionEnd(_ sender: UITextField) {
       CheckPassword=SupportFunction.CheckPasswordTextFiled(with: Password)
        print("Password Check \(CheckPassword)")
    }
    
    //Back to Login&register View
    @IBAction func BackBTN(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
  
    
    //Picker Image from Photo library
    @IBOutlet weak var SelectPortraitBTN: UIButton!
    @IBAction func SelectPortrait(_ sender: UIButton) {
        UploadImageFromdevice()
    }

    
    
    var ChooseImage:UIImage!
    @IBOutlet weak var RegisterNextBTN: UIButton!
    var IsEmailinServer:Bool=true
    @IBAction func RegisterNextAction(_ sender: UIButton) {
        view.MakeRotateBallLoading(Title: "Register", Enable: false)
        if Region.text != ""{CheckRegion=true}
        print("\(CheckNickname)-\(CheckEmail)-\(CheckPassword)-\(CheckRegion)")
        if (CheckPassword==true)&&(CheckEmail==true)&&(CheckNickname==true)&&(Region.text != ""){
            //  Add Animation
                print("开始第一个取值 Start First step for Check Server ID")
            //  Start First step for Check Server ID
//            LeanCloudSearch.GetAVUserID(UserEmail: self.Email.text!, completion: {(ServerID)in
//                self.RegisterNextBTN.isEnabled=true
//                if ServerID == nil{
//                    print("+++++++++++++Retunrn Value \(ServerID)-------End")
//                    self.IsEmailinServer=false
//                }else{
//                    print("+++++++++++++Retunrn Value\(ServerID)-------End")
//                    self.IsEmailinServer=true
//                    //  Remove Animation
//                    self.view.DismissBallRotationLoading()
//                }})
                print("完成第一个取值 Finish First step for Check Server ID")
                print("Email在服务器上  Email in the server\(self.IsEmailinServer)")
                self.RegisterNextBTN.isEnabled=false
                SupportFunction.delay(by: 3){
                    if self.IsEmailinServer==false{
                        //  Remove Animation
                        self.view.DismissBallRotationLoading()
                        SupportFunction.ShowNoticeAlert(on: self, with: "New Register Fail", Message: "Your Email had been register, try to log in with your Email or SupChatsID")
                        SupportFunction.delay(by: 3){
                            self.navigationController?.pushViewController(self.storyboard?.instantiateViewController(withIdentifier: "LoginViewControllerID")as! UIViewController, animated: true)
                        }
                    }else{
                        //  Add Animation
                        self.view.MakeRotateBallLoading(Title: "Loading", Enable: false)
                        print("开始保存")
                        self.registerInAVUser()
                        UserDefaults.standard.set(self.Nickname.text, forKey: "DFRUserName")
                        UserDefaults.standard.set(self.Email.text, forKey: "DFREmail")
                        UserDefaults.standard.set(self.Password.text, forKey: "DFRPassword")
                        UserDefaults.standard.set(self.SupChatsID, forKey: "DFRSupChatsID")
                        UserDefaults.standard.set(self.Region.text, forKey: "DFRRegion")
                        print("Save all information...保存注册信息")
                    }
                }
        }else{
            print("还有剩余空白")
            //  Remove Animation
            self.view.DismissBallRotationLoading()
            SupportFunction.CheckEmailTextFiled(with: Email)
            SupportFunction.CheckPasswordTextFiled(with: Password)
            if SupportFunction.CheckTextFiled(with: Region)==false{
                SupportFunction.WarningTextField(with: Region)
            }else{
                SupportFunction.CorrectTextField(with: Region)
            }
            if SupportFunction.StringWithAlphanumericNumber(with: Nickname.text!)==false{
                SupportFunction.WarningTextField(with: Nickname)
                CheckNickname=false
            }else{
                SupportFunction.CorrectTextField(with: Nickname)
                CheckNickname=true
            }
        }
        

    }

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
    
    
    var SupChatsID:String = ""
    func CreatSupChatsID(){
        let SubstringEmail = SupportFunction.SubString(with: Email.text!, CharacterSymbol: "@")
        SupChatsID="\(Nickname.text!)_\(SubstringEmail)"
        print(SupChatsID)
        UserDefaults.standard.set(SupChatsID, forKey: "DFRSupChatsID")
    }
 
    
    func RegisterInLeanCloud(){
        print("开始保存用户信息到Server")
        //  Save Detail to the Server
        let NewUser=AVObject(className: "UserLoginDetail")
        //  Get Detail from local
        NewUser["Username"]=Nickname.text!
        NewUser["Password"]=Password.text!
        NewUser["Email"]=Email.text!
        NewUser["Region"]=Region.text
        NewUser["AVUserID"]=AVNewUserID
        NewUser["SupChatsID"]=SupChatsID
        if ChooseImage==nil{
            print("没有图片")
        }else{
            let OrginIMG:NSData=UIImagePNGRepresentation(ChooseImage) as! NSData
            let IMGData=AVFile(data:UIImageJPEGRepresentation(UIImage(data: OrginIMG as! Data)!, 0.8)! , name: "\(Nickname.text!).JPG")
            NewUser["Portrait"]=IMGData
        }
        //  Save the user's Detail into UserDetal in Server
        NewUser.saveInBackground{(succeed,error)in
            if succeed{
                LeanCloudSearch.GetUserDetailIDBySupChatsID(SupChatsID:self.SupChatsID , completion: {(ServerUserDetailID)in
                    if ServerUserDetailID != nil{
                        UserDefaults.standard.set(ServerUserDetailID, forKey: "Email")
                    }else{
                        print("Can't Find UserName in Server 未找到此用户名字")
                    }
                })
                print("Save in the server...云端保存成功")
                self.navigationController?.pushViewController(self.storyboard?.instantiateViewController(withIdentifier: "VerifiedEmailViewControllerID")as! UIViewController, animated: true)
            }else{
                self.view.DismissBallRotationLoading()
                SupportFunction.ShowNoticeAlert(on: self, with: "Register Error", Message: "Please change Datail or try again.")
                print(error ?? "Fail save in server...云端保存失败")}
        }
    }
    
    
    var AVNewUserID:String = ""
    func registerInAVUser() {
        //  Creat SupChatsID
        CreatSupChatsID()
        print("开始保存用户信息到AVUser")
        //Creat new User in AVUser
        let NewUsers=AVUser()
        //New User Detail
        NewUsers.username="\(SupChatsID)"
        NewUsers.email="\(Email.text!)"
        NewUsers.password="\(Password.text!)"
        if ChooseImage==nil{
            print("没有图片")
        }else{
            let OrginIMG:NSData=UIImagePNGRepresentation(ChooseImage) as! NSData
            let IMGData=AVFile(data:UIImageJPEGRepresentation(UIImage(data: OrginIMG as! Data)!, 0.8)! , name: "\(Nickname.text!).JPG")
            NewUsers.setObject(IMGData, forKey: "avatar")
        }
        //  Save New User to the Server
        NewUsers.signUpInBackground{(succeeded,error)-> Void in
            if (succeeded){
                print("Save AVUser succeeded...保存用户数据成功")
                print("AVUser用户ID：\(NewUsers.objectId)")
                self.AVNewUserID=NewUsers.objectId!
                UserDefaults.standard.set(self.AVNewUserID, forKey: "DFRAVUserID")
                self.RegisterInLeanCloud()
            }else{
                print("错误信息\(error)")
                self.view.DismissBallRotationLoading()
                SupportFunction.ShowNoticeAlert(on: self, with: "Register Error", Message: "Please change Email or try again.")
            }
        }
        
    }

    
    func RegisterLayout(){
        Nickname.layer.cornerRadius=20
        Region.layer.cornerRadius=20
        Email.layer.cornerRadius=20
        Password.layer.cornerRadius=20
        RegisterNextBTN.layer.cornerRadius=25
        Password.isSecureTextEntry=true
        CreatRegionPicker()
    }
    
    //Help Function
    @IBOutlet weak var Help: UIButton!
    @IBAction func HelpAction(_ sender: UIButton) {
////////////////////////////转跳到帮助界面
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "HelpViewControllerID")as! UIViewController, animated: true)
        print("Click Help...进入帮助")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RegisterLayout()
        configureTapGesture()
    }
    
    private func configureTapGesture(){
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.HandleTap))
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
extension RegisterViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return RegionDataList.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Region.text=RegionDataList[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return RegionDataList[row]
    }
}
extension RegisterViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let SelectImage = info[UIImagePickerControllerEditedImage]as? UIImage{
        SelectPortraitBTN.setBackgroundImage(SelectImage, for: .normal)
        ChooseImage=SelectImage
        }
        UserDefaults.standard.set(UIImagePNGRepresentation(ChooseImage) as! NSData, forKey: "DFRPortrait")
        print("图片路径\(UserDefaults.standard.object(forKey: "DFRPortrait"))")
        picker.dismiss(animated: true, completion: nil)
        SelectPortraitBTN.setTitleColor(UIColor.clear, for: .normal)
    }
}
