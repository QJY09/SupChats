//
//  AppDelegate.swift
//  SupChats
//
//  Created by QJY on 05/09/2018.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit
import CoreData
import LeanCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

  func ConnectServer(completion: ()->Void) {
        //initall Appkey
    //    RCIM.shared().initWithAppKey("pgyu6atqpextu")
        
        //融云Connect to token
/*        RCIM.shared().connect(withToken:"luGyGE4SB9VKrD1ierAZdlBSIOls1/QK/gmbVvrvNOkFtIPYq1KTTgxe6z5/wjrCoY9BGQ2uH9VxG0Gujp5fnw==", success: { (_) -> Void in print("connect Success.连接成功")
            let currentUserInfo = RCUserInfo(userId: "QJY", name: "QJY", portrait: nil)
            RCIMClient.shared().currentUserInfo = currentUserInfo
        },
        error: { (_) -> Void in print("Connect Error。连接错误")})
        {print("Connect Token InCorrect。Token 不正确，或失效")}
        completion()*/
    }
    
    func USLeanCloudServer(){
        LCApplication.default.set(
            id:  "fTc2k5lfSU2iH8hfcuyoPFtC-MdYXbMMI",
            key: "G1JWMrgRWLDjqiwD2r2Jr66M"
    )
    LCChatKit.setAppId("fTc2k5lfSU2iH8hfcuyoPFtC-MdYXbMMI", appKey: "G1JWMrgRWLDjqiwD2r2Jr66M")
    }
    func CNSLeanCloudServer(){
        LCApplication.default.set(
            id:  "TaGXqpQ1rMDDwHuYKt1eOwPk-gzGzoHsz",
            key: "9pO7kqfbbNP6Xil4E0RGEIFe"
        )
        AVOSCloud.setApplicationId("TaGXqpQ1rMDDwHuYKt1eOwPk-gzGzoHsz", clientKey: "9pO7kqfbbNP6Xil4E0RGEIFe")
        LCChatKit.setAppId("TaGXqpQ1rMDDwHuYKt1eOwPk-gzGzoHsz", appKey: "9pO7kqfbbNP6Xil4E0RGEIFe")
    }
    func CNELeanCloudServer(){
        LCApplication.default.set(
            id:  "a6PehJLKhXDItXHg9Y8JTzPB-9Nh9j0Va",
            key: "A3sLoa8AdKBu2u09ymifULwy"
        )
        LCChatKit.setAppId("a6PehJLKhXDItXHg9Y8JTzPB-9Nh9j0Va", appKey: "A3sLoa8AdKBu2u09ymifULwy")
    }
    
    func LeanCloudPlugin(){
        LCCKInputViewPluginTakePhoto.registerSubclass()
        LCCKInputViewPluginPickImage.registerSubclass()
        LCCKInputViewPluginLocation.registerSubclass()
    }
    
    //LeanCloud ClientID
    //  设置用户登录体系
    func LeanCloudClient(){
        LCChatKit.sharedInstance()
    }

    func InitialView(){
        let Storyboard:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        if UserDefaults.standard.object(forKey: "DFLUserID")as? String == nil{
            window?.rootViewController=Storyboard.instantiateViewController(withIdentifier: "LoginNavigationControllerID")
            print("Jump to Login Regsition View")
        }else{
            window?.rootViewController=Storyboard.instantiateViewController(withIdentifier: "MainTarBarControllerID")
            print("Jump to MainViewController")
        }
    }
    

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window?.backgroundColor=UIColor.black
        //make some animation in the launchView
        self.window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        //seting user infomation supplier
        
        //  Connect to RongCloud server
        //RCIM.shared()?.userInfoDataSource=self
       
        
        //  Connect to LeanCloud server
       CNSLeanCloudServer()    //中国华北leanCloud节点
    //    CNELeanCloudServer()  //中国华东LeanCloud节点
    //    USLeanCloudServer()   //美国leanCloud节点
        
        
        //  Add LeanCloud PlugIn Group
/////////        LeanCloudPlugin()
        
        //  Test Post From ServerTest
/*        let post = LCObject(className: "Post")
        try? post.set("words", value: "Test")
        _ = post.save { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                break
            }
        }
*/
        //  More Support function Test
///////////        InitialView()
        
        return true
    }
    
    
  /*  func getUserInfo(withUserId userId: String!, completion: ((RCUserInfo?) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId=userId
        switch userId {
        case "QJY":
            userInfo.name="QJY"
            userInfo.portraitUri="http://img1.touxiang.cn/uploads/20120509/09-014623_68.jpg"
        case "QJY1":
            userInfo.name="QJY1"
            userInfo.portraitUri="http://img03.store.sogou.com/app/a/10010016/b1296a6eecf78db4143f93678c40ed0b"
        default:
            print("Can't find users查找不到用户")
        }
        return completion(userInfo)
    }*/

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "SupChats")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Save Data Succeed...保存数据成功")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

