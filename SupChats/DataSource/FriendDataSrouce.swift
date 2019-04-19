

//
//  FriendDataSrouce.swift
//  SupChats
//
//  Created by QJY on 2019/3/7.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit
import CoreData

struct FriendDataSrouce {
    var FriendsDetailData=[FriendsInformation]()
    var FriendArray:[FriendsInformation]=[]
    
    //Save sttruction Data to Coredata
    private mutating func SaveFriendsDataSrouce(AVUserID:String,Profile:String,Username:String,SupchatsID:String,Region:String,QRCode:Data,Gender:String,Signature:String,CustomerName:String){
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let FriendsmanagedContext=appDelegate.persistentContainer.viewContext
        let FriendsDetialEntity=NSEntityDescription.entity(forEntityName: "FriendsInformation", in: FriendsmanagedContext)!
        let FriendsDatail=NSManagedObject(entity: FriendsDetialEntity, insertInto: FriendsmanagedContext)
        FriendsDatail.setValue(AVUserID, forKey: "avuserid")
        FriendsDatail.setValue(Profile, forKey: "userprofile")
        FriendsDatail.setValue(Username, forKey: "username")
        FriendsDatail.setValue(SupchatsID, forKey: "usersupchatsid")
        FriendsDatail.setValue(Region, forKey: "userregion")
        FriendsDatail.setValue(QRCode, forKey: "userqrcode")
        FriendsDatail.setValue(Gender, forKey: "usergender")
        FriendsDatail.setValue(Signature, forKey: "usersignature")
        FriendsDatail.setValue(CustomerName, forKey: "usercostomername")
        do{
            try FriendsmanagedContext.save()
            FriendsDetailData.append(FriendsDatail as! FriendsInformation)
        }catch let Error as NSError{
            print("储存用户数据失败 Unable to save managed object context.")
        }
    }
    
    private mutating func FatchEachFriendsDataSource2(){
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let FriendsmanagedContext=appDelegate.persistentContainer.viewContext
        let FriendsFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendsInformation")
        let DecreasingSort=NSSortDescriptor(key: "username", ascending: true)
        FriendsFetchRequest.sortDescriptors=[DecreasingSort]
        for FriendItem in FriendsDetailData{
            print(FriendItem.usercostomername!)
            print(FriendItem.username!)
            print(FriendItem.userqrcode!)
            FriendArray=[FriendItem]
        }
    }
    
    func FatchAllFriendData(){
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let FriendsmanagedContext=appDelegate.persistentContainer.viewContext
        do{
            try FriendsmanagedContext.fetch(FriendsInformation.fetchRequest())
        }catch {print("Error Is ------\(error)")}
    }
    
    /*
    mutating func FatchFriendsDataSourceTest1(){
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let FriendsmanagedContext=appDelegate.persistentContainer.viewContext
        let FriendsFetchRequest:NSFetchRequest<FriendsInformation> = FriendsInformation.fetchRequest()
        let DecreasingSort=NSSortDescriptor(key: "username", ascending: true)
        FriendsFetchRequest.sortDescriptors=[DecreasingSort]
        var FatchDataController:NSFetchedResultsController<FriendsInformation>!
        FatchDataController=NSFetchedResultsController(fetchRequest: FriendsFetchRequest, managedObjectContext: FriendsmanagedContext, sectionNameKeyPath: nil, cacheName: nil)
//        FatchDataController.delegate = UIViewController.self
        do{
            try FatchDataController.performFetch()
            if let Object = FatchDataController.fetchedObjects{
                FriendArray=Object
            }
        }
    }*/
    
}

