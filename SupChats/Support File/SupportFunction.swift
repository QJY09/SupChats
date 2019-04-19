//
//  SupportFunction.swift
//  SupChats
//
//  Created by QJY on 2019/2/4.
//  Copyright © 2019 QJY. All rights reserved.
//

import Foundation
import UIKit


struct SupportFunction {
    
    static func iPhoneViBrate(){
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    //字符串截取@之前的字符
    static func SubString(with FullString:String,CharacterSymbol:Character) -> String{
        let Position=FullString.lastIndex(of: CharacterSymbol)
        let PrefixSubString=FullString.prefix(upTo: Position!)
        return String(PrefixSubString)
    }
    

    
    //Pop To Web View With URL
    static func PopToWebview(on View:UIViewController,with URLLink:String){
        let WebView=UIWebView()
        WebView.loadRequest(NSURLRequest(url: NSURL(string: URLLink) as! URL) as URLRequest)
        WebView.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        WebView.delegate=View.self as! UIWebViewDelegate
        View.view.addSubview(WebView)
    }
    
    /// 代码延迟运行
    static func delay(by delayTime: TimeInterval, qosClass: DispatchQoS.QoSClass? = nil,_ closure: @escaping () -> Void) {
        /// - Parameters:
        ///   - delayTime: ex:.seconds(5)、.milliseconds(500)
        ///   - qosClass: use Global QOS class (default is nil, representing main thread)
        ///   - closure: Ater delay time run code
        let dispatchQueue = qosClass != nil ? DispatchQueue.global(qos: qosClass!) : .main
        dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delayTime, execute: closure)
    }
    
    static func ShowNoticeAlert(on VC:UIViewController,with Title:String, Message:String){
        let alert=UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
        VC.present(alert, animated: true, completion: nil)
    }
    
    static func ShowNoticeAlertSheet(on VC:UIViewController,with Title:String, Message:String,ActionTitle1:String,ActionHandler1:((UIAlertAction) -> Void)?,ActionTitle2:String,ActionHandler2:((UIAlertAction) -> Void)?){
        let alert=UIAlertController(title: Title, message: Message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: ActionTitle1, style: .default, handler: ActionHandler1))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        VC.present(alert, animated: true, completion: nil)
    }
    
    static func WarningTextField(with TextFiledName:UITextField){
        TextFiledName.layer.shadowOpacity=0.5
        TextFiledName.layer.shadowColor = UIColor.red.cgColor
        TextFiledName.layer.shadowOffset = CGSize.zero
        TextFiledName.layer.shadowRadius = 5
    }
    
    static func CorrectTextField(with TextFiledName:UITextField){
        TextFiledName.layer.shadowOpacity=0
        TextFiledName.layer.shadowColor = UIColor.clear.cgColor
        TextFiledName.layer.shadowOffset = CGSize.zero
        TextFiledName.layer.shadowRadius = 0
    }
    
    static func CheckTextFiled(with TextFiledName:UITextField) -> Bool{
        var Check:Bool
        if TextFiledName.text == ""{
            print("\(String(describing: TextFiledName.placeholder))为空")
            SupportFunction.WarningTextField(with: TextFiledName)
            Check=false
        }else{
            print("\(TextFiledName.placeholder)不为空")
            SupportFunction.CorrectTextField(with: TextFiledName)
            Check=true
        }
        print("The Text Filed is \(Check)")
        return Check
    }

    
    static func CheckEmailTextFiled(with TextFiledName:UITextField) -> Bool {
        var Check:Bool
        if TextFiledName.text == ""{
            print("\(TextFiledName.placeholder)为空")
            SupportFunction.WarningTextField(with: TextFiledName)
            Check = false
        }else{
            print("\(TextFiledName.placeholder)不为空")
            if IsValidEmail(with: TextFiledName)==false{
                SupportFunction.WarningTextField(with: TextFiledName)
                Check=false
            }else{
            SupportFunction.CorrectTextField(with: TextFiledName)
                Check=true
            }
        }
        print("The Email Filed is \(Check)")
        return Check

    }
    
    static func CheckPasswordTextFiled(with TextFiledName:UITextField) -> Bool {
        var Check:Bool
        if TextFiledName.text == ""{
            print("\(TextFiledName.placeholder)为空")
            SupportFunction.WarningTextField(with: TextFiledName)
            Check = false
        }else{
            print("\(TextFiledName.placeholder)不为空")
            if IsValidPassword(with: TextFiledName)==false{
                SupportFunction.WarningTextField(with: TextFiledName)
                Check=false
            }else{
                SupportFunction.CorrectTextField(with: TextFiledName)
                Check=true
            }
        }
        print("The Password Filed is \(Check)")
        return Check
    }

    static func IsValidEmail(with EmailTextFiled:UITextField) -> Bool {
        let EmailFormat="[A-Z0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"
        let EmailTest=NSPredicate(format: "SELF maTCHES %@", EmailFormat)
        let TextFieldString:String=EmailTextFiled.text!
        return EmailTest.evaluate(with:TextFieldString)
    }
    
    static func IsValidEmailWithString(with EmailString:String) -> Bool {
        let EmailFormat="[A-Z0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"
        let EmailTest=NSPredicate(format: "SELF maTCHES %@", EmailFormat)
        let TextFieldString:String=EmailString
        return EmailTest.evaluate(with:TextFieldString)
    }
    static func IsValidPassword(with PasswordTextFiled:UITextField) -> Bool {
        let PasswordFormat="(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$&*.]).{8,16}"
        //(?=.*[A-Z])                Ensure string has one uppercase letters.
        //(?=.*[!@#$&*.])            Ensure string has one special case letter.
        //(?=.*[0-9])                Ensure string has one digits.
        //(?=.*[a-z])                Ensure string has one lowercase letters.
        //.{8,16}                    Ensure string is of length 8 to 16
        let PasswordTest=NSPredicate(format: "SELF maTCHES %@", PasswordFormat)
        let PasswordFieldString:String=PasswordTextFiled.text!
        return PasswordTest.evaluate(with:PasswordFieldString)
    }
    
    static func StringWithAlphanumericNumber(with FullString:String) -> Bool{
        let LetterNumberFormat="[A-Z0-9a-z]{1,64}"
        let LetterNumberTest = NSPredicate(format: "SELF maTCHES %@", LetterNumberFormat)
        return LetterNumberTest.evaluate(with:FullString)
    }
    
    static func IsValidURL(with URL:String) -> Bool{
        let URLFormat="((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        let URLtest=NSPredicate(format: "SELF MATCHES %@", URLFormat)
        return URLtest.evaluate(with: URL)
    }
    
    static func transitionPush(on ViewController:UIViewController,with MoveViewController:UIViewController){
        let transition=CATransition()
        transition.duration=0.3
        transition.timingFunction=CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type=kCATransitionPush
        transition.subtype=kCATransitionFromRight
        ViewController.view.window?.layer.add(transition, forKey: kCATransition)
        ViewController.present(ResetPasswordViewController(), animated: false, completion: nil)
    }

    

    
}
extension SupportFunction{

    
}
/*
 static func EncodingImage(with Image:UIImage)-> Void{
 let Imagedata:NSData=UIImagePNGRepresentation(Image) as! NSData
 }
 
 static func DecodingPNGImage(with PNGImage:NSData)->Void{
 let _:UIImage=UIImage(data: PNGImage as Data)!
 }
 */
