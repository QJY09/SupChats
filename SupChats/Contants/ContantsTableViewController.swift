//
//  ContantsTableViewController.swift
//  SupChats
//
//  Created by QJY on 05/09/2018.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit
import CoreData

//Check the order number in Coredata
var FriendsNumberInFriendsDetailData:Int=0
//Transfer Name to the Friends Information View
var SelectedName:String=""


class ContantsTableViewController: UITableViewController,NSFetchedResultsControllerDelegate{
    var FriendsDetailData=[FriendsInformation]()
    var FriendsGroup = [String:[String]]()
    var FriendsGroupTitle=[String]()
    var CheckFriendsNumber:Int=0
    var CurrentFriendsNumberInFriendsDetailData:Int=0
    
    
    override func viewDidLoad() {
        //print("Show 4Choose tar bar controller")
        //tabBarController?.tabBar.isHidden = false
        
        print("Contants Table View loading..")
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        tableView.dataSource=self
        tableView.delegate=self
        if FriendsHandler.FetchFriendsInformaitonObject() != nil{
            FriendsDetailData=FriendsHandler.FetchFriendsInformaitonObject()
            tableView.reloadData()
        }
        for number in FriendsDetailData{
            CurrentFriendsNumberInFriendsDetailData=CurrentFriendsNumberInFriendsDetailData+1
        }
        print("Contants Table View finish loading")
    }
    
    func MakeFriendsGroup(){
        for FriendDetail in FriendsDetailData{
            
            //Change Chinese to Pinying For manage Friends Group
            let FriendsNameMutableString=NSMutableString(string:FriendDetail.username!)
                
            CFStringTransform(FriendsNameMutableString, nil, kCFStringTransformToLatin, false)
            CFStringTransform(FriendsNameMutableString, nil, kCFStringTransformStripDiacritics, false)
            
            //Check First letter for name of Friends Group
            let FirstLetterOfName=FriendsNameMutableString.substring(to: 1).uppercased()
            //Check the letter is in the list
            // If the letter in the FriendsGroupTitle array, put the Friends into the corresponding Group.
            // If the letter not in the FriendsGroupTitle array, Creat a new Group with the new first letter
            if var value = FriendsGroup[FirstLetterOfName]{
                value.append(FriendDetail.username!)
                FriendsGroup[FirstLetterOfName]=value
            }else{
                FriendsGroup[FirstLetterOfName]=[FriendDetail.username!]
            }
        }
        FriendsGroupTitle=FriendsGroup.keys.sorted()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        CheckFriendsNumber=0
        for number in FriendsDetailData{
            CheckFriendsNumber=CheckFriendsNumber+1
        }
        if CheckFriendsNumber == CurrentFriendsNumberInFriendsDetailData{
            print("The Table don't need Reload")
            print(CheckFriendsNumber)
            print(CurrentFriendsNumberInFriendsDetailData)
        }else{
            print(CheckFriendsNumber)
            print(CurrentFriendsNumberInFriendsDetailData)
            if FriendsHandler.FetchFriendsInformaitonObject() != nil{
                FriendsDetailData=FriendsHandler.FetchFriendsInformaitonObject()
                tableView.reloadData()
            }
        }

        MakeFriendsGroup()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        print("Contants Receive Memory Warning Loading..")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("Contants Receive Memory Warning Finish Loading")
        
    }
    
    // MARK: - Table view data source
    //Right hand side quickly searching Group
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return FriendsGroupTitle
    }
    
    //number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sectionsArray
        return FriendsGroup.count
    }
    
    //number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let FirstLetter = FriendsGroupTitle[section]
        // #warning Incomplete implementation, return the number of rows
        return FriendsGroup[FirstLetter]!.count
    }
    
    
    // Configure the cell...
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContantsTableViewCell", for: indexPath)
        let FirstLetter = FriendsGroupTitle[indexPath.section]
        let FriendInGroup=FriendsGroup[FirstLetter]!
        cell.textLabel?.text=FriendInGroup[indexPath.row]
//        cell.imageView?.image=UIImage(data: FriendsDetailData.value(forKey: "userprofile")as! Data, scale: 1)
        return cell
        
        //Friends Item Setting
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ContantsTableViewCell", for: indexPath)
//        let FriendsName = FriendsItem.stringValue
//        cell.textLabel?.text =  name
//        print("Configure the cell in Contants TableView\(cell)")
//        return cell
    }
    
    
    // HeadInSection click
    @objc func objcCloseOpenButton(){
        print("Click close button of table view head succeed")
    }
    
    
    // HeadInSection
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        print("Creating Head in Section..")
        /*
         let CloseOpenButton = UIButton(type: .system)
         CloseOpenButton.setTitle("Close", for: .normal)
         CloseOpenButton.setTitleColor(UIColor.white, for: .normal)
         CloseOpenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
         CloseOpenButton.addTarget(self, action: #selector(objcCloseOpenButton), for: .touchUpInside)
         */
        let label = UILabel()
        label.text = FriendsGroupTitle[section]
        label.backgroundColor = UIColor.groupTableViewBackground
        print("Creating Head in Section Done.")
        return label
    }
    
    
    // HeightInSectctionHead
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("Doing edit of the thable view..")
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        print("Doing edit of the table view done")
    }
    
    
    //Connect with Contants Information View
    var SelectRow = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectRow = indexPath.row
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        SelectedName=(tableView.cellForRow(at: indexPath)?.textLabel?.text)!
        print("The Selected Name is \(SelectedName)")
        performSegue(withIdentifier: "ShowPersonalInformation", sender: self)
    //tabBarController?.tabBar.isHidden=true
    //print("Hidden TabBar Controller.")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="ShowPersonalInformation"){
            FriendsNumberInFriendsDetailData=0
            //Check selected Friend position in the FriendsItem list
            for FriendData in FriendsDetailData{
                if SelectedName==FriendData.value(forKey: "username")as! String{
                    break
                }else{
                    continue
                }
            FriendsNumberInFriendsDetailData=FriendsNumberInFriendsDetailData+1
            }
        print("The numebr will be pass to Contants View is \(FriendsNumberInFriendsDetailData)")
        }else{
            print("Error in the Show Friends Detail")
        }
        
    }

    
    
    
    
}

