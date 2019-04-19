//
//  SearchFriendsViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/24.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class SearchFriendsViewController: UIViewController {
    
    @IBOutlet weak var SearchFriendBar: UISearchBar!
    @IBOutlet weak var TypeingStackView: UIStackView!
    @IBOutlet weak var TypingImage: UIImageView!
    @IBOutlet weak var SearchLabel: UILabel!
    @IBOutlet weak var SearchErrorLabel: UILabel!
    @IBOutlet weak var TypingText: UILabel!
    @IBOutlet weak var SearchFriendBTN: UIButton!
    @IBAction func SearchFriendAction(_ sender: UIButton) {
        print("Start To Search")
        TryToSearchID()
    }
    
    
    var PassSupChatsIDToNewFriendsView:String=""
    var IsSearchFromSupChats:Bool=false
    func TryToSearchID() {
        let SearchString=SearchFriendBar.text
        //  Show Searching information in the stack view
        ShowSearchingInformation()
        if SupportFunction.IsValidEmailWithString(with: SearchString!)==true{
            print("通过Email搜索--Search from Email")
            IsSearchFromSupChats=false
            LeanCloudSearch.GetSupChatsID(UserEmail: SearchString!, completion: {(UserSupChats) in
                self.PassSupChatsIDToNewFriendsView=UserSupChats!
                if UserSupChats != ""{
                    print("通过Email搜索到信息--Get user SupChats by search Email")
                    self.PassDetailToNewPage()

                }else{
                    print("Can't Find User ID in Server 未找到此用户ID")
                    //  Show Searching Error in the stack view
                    self.ShowSearchingError()
                }
            })
        }else if (SearchString?.contains("_"))!{
            IsSearchFromSupChats=true
            print("通过SupChatsID搜索--Search from SupChatsID")
            LeanCloudSearch.GetAVUserIDBySupChatsID(SupChatsID: SearchString!, completion: {(ServerUserID) in            if ServerUserID != nil{
                self.PassSupChatsIDToNewFriendsView=SearchString!
                print("通过SupChats搜索到信息--Get user detail by search SupChats")
                self.PassDetailToNewPage()
            }else{
                print("Can't Find User ID in Server 未找到此用户ID")
                //  Show Searching Error in the stack view
                self.ShowSearchingError()
                }
            })
        }
    }
    
    func PassDetailToNewPage(){
        let NewFriendsDetail=storyboard?.instantiateViewController(withIdentifier: "NewFriendViewControllerID") as! NewFriendViewController
        NewFriendsDetail.SupChatsID=PassSupChatsIDToNewFriendsView
        NewFriendsDetail.PassIsSearchFromSupChats=IsSearchFromSupChats
        self.navigationController?.pushViewController(NewFriendsDetail, animated: true)
    }
    
    func ShowSearchingInformation(){
        TypingImage.isHidden=false
        SearchLabel.isHidden=false
        TypingText.isHidden=false
        SearchErrorLabel.isHidden=true
    }
    
    func ShowSearchingError(){
        TypingImage.isHidden=true
        SearchLabel.isHidden=true
        TypingText.isHidden=true
        SearchErrorLabel.isHidden=false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden=true
        TypeingStackView.isHidden=true
        SearchFriendBar.delegate=self
        self.view.backgroundColor=UIColor.groupTableViewBackground
        self.SearchFriendBar.becomeFirstResponder()
        configureTapGesture()
        // Do any additional setup after loading the view.
    }

    
    
    
    func SearchFriendsLayout(){
        self.navigationController?.navigationBar.isHidden=true
        configureTapGesture()
    }
    
    
    private func configureTapGesture(){
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.HandleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func HandleTap(){
        print("Handle Tap was called")
        view.endEditing(true)
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.popViewController(animated: true)
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
extension SearchFriendsViewController:UISearchBarDelegate,UISearchControllerDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        SearchFriendBar.placeholder="Email/SupChatsID"
        HandleTap()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("开始搜索 Start To Search")
        TryToSearchID()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if SearchFriendBar.text != ""{
            TypeingStackView.isHidden=false
            ShowSearchingInformation()
            TypingText.text=SearchFriendBar.text
            print("搜索文字内容\(SearchFriendBar.text)")
            self.view.backgroundColor=UIColor.groupTableViewBackground
        }else{
            TypeingStackView.isHidden=true
        }
    }
    
}
