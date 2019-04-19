//
//  AddFriendViewController.swift
//  SupChats
//
//  Created by QJY on 2019/2/21.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    @IBOutlet weak var FriendsSearchBar: UISearchBar!
    @IBOutlet weak var FriendSearchBTN: UIButton!
    @IBAction func FriendSearchAction(_ sender: UIButton) {
        print("Click Search Friends BTN")
        self.show(storyboard?.instantiateViewController(withIdentifier:"SearchFriendsViewControllerID")as! UIViewController, sender: nil)
//        self.navigationController?.navigationBar.isHidden=true
    }
    
    @IBOutlet weak var FunctionTableView: UITableView!
    var Title:[String]=["Scan ID","Group Number"]
    let Intruction:[String]=["Scan SupChats QRID to add friend","Add to a new group chats with code"]
    
    func FunctionTableViewSetting(){
        self.title = "Add Friends"
        tabBarController?.hidesBottomBarWhenPushed=true
        let nib=UINib(nibName: "DefaultTableViewCell", bundle: nil)
        FunctionTableView.register(nib, forCellReuseIdentifier: "DefaultCell")
        self.navigationController?.navigationBar.isHidden=false
        self.FunctionTableView.isScrollEnabled=false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FunctionTableViewSetting()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

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
extension AddFriendViewController:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=FunctionTableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)as! DefaultTableViewCell
        cell.CellInit(ImageName: "MyLogo.jpg", Title: Title[indexPath.row], Introduction:Intruction[indexPath.row])
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Title.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
