//
//  ChatsTableViewController.swift
//  SupChats
//
//  Created by QJY on 05/09/2018.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit

class ChatsTableViewController:UITableViewController{
     var NameArraytest=["a","aa","b","bb","c","cc","d","dd","e","ee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
   //     self.tableView.sectionHeaderHeight = 0
        print("Chats Table View finish loading 加载列表完成")

    }
    
    override func didReceiveMemoryWarning() {
        print("Chats Receive Memory Warning Loading..")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("Chats Receive Memory Warning Finish Loading")
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return NameArraytest.count
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var  Cell:ChatsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "ChatsBaseCell", for: indexPath) as!ChatsTableViewCell
        
        if Cell==nil{
            Cell = ChatsTableViewCell(style: .default, reuseIdentifier: "ChatsBaseCell")
        }
        
        // Configure the cell...
        Cell.ProfilePhoto.image = UIImage(named: "标志")
        Cell.UserName.text = NameArraytest[indexPath.row]
        Cell.UserLastMessage.text = "This is last messages"
        Cell.LastMessageTime.text = "1 min ago"
        print("Creat Table View Cell is successed\(Cell)")
        return Cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        print("Doing edit of the table view done")
    }
    
    
    //Connect with Chating Message View
    var SelectRow = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectRow = indexPath.row
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        performSegue(withIdentifier: "ShowChatingMessageView", sender: self)
        navigationController?.tabBarController?.tabBar.isHidden=true
    }
    
    
    // Override to support rearranging the table view.
    /*
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
