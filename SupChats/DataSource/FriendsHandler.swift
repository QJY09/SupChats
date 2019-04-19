//
//  FriendsHandler.swift
//  SupChats
//
//  Created by QJY on 2019/3/9.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit
import CoreData
class FriendsHandler: NSObject {
    private class func GetContext()->NSManagedObjectContext{
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    //Save sttruction Data to Coredata
    class func SaveFriendsDataSrouce(AVUserID:String,Profile:String,Username:String,SupchatsID:String,Region:String,QRCode:Data,Gender:String,Signature:String,CostomerName:String)->Bool{
        let Context=GetContext()
        let FriendsDetialEntity=NSEntityDescription.entity(forEntityName: "FriendsInformation", in: Context)!
        let FriendsDatail=NSManagedObject(entity: FriendsDetialEntity, insertInto: Context)
        FriendsDatail.setValue(AVUserID, forKey: "avuserid")
        FriendsDatail.setValue(Profile, forKey: "userprofile")
        FriendsDatail.setValue(Username, forKey: "username")
        FriendsDatail.setValue(SupchatsID, forKey: "usersupchatsid")
        FriendsDatail.setValue(Region, forKey: "userregion")
        FriendsDatail.setValue(QRCode, forKey: "userqrcode")
        FriendsDatail.setValue(Gender, forKey: "usergender")
        FriendsDatail.setValue(Signature, forKey: "usersignature")
        FriendsDatail.setValue(CostomerName, forKey: "usercostomername")
        
        do{
            try Context.save()
            return true
        }catch let Error as NSError{
            print("储存用户数据失败 Unable to save managed object context.")
            return false
        }
    }
    
    class func FetchFriendsInformaitonObject()->[FriendsInformation]{
        let Context = GetContext()
        var FriendsDetail:[FriendsInformation]?=nil
        do {
            FriendsDetail=try Context.fetch(FriendsInformation.fetchRequest())
            return FriendsDetail!
        }catch{return FriendsDetail!}
    }
    
}
