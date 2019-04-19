//
//  Moment2TableViewController.swift
//  SupChats
//
//  Created by QJY on 2019/4/19.
//  Copyright © 2019 QJY. All rights reserved.
//


import UIKit

class MomentTableViewController: BaseViewController,ImageBrowserDelegate{
    
    let identyfierTable1 = "TableViewCell"
    
    var theImage = UIImage()
    var theIndex = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func LoadingFriendsPost(){
        
    }
    
    //  Moment View
    override func configSubViews() {
        //  setup Title View
        let TitleView = UIButton.init(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        TitleView.setTitle("Friends Moment", for: .normal)
        //        TitleView.setImage(UIImage.init(named: "Refresh"), for: .normal)
        TitleView.addTarget(self, action: #selector(chooseAction(sender:)), for: .touchUpInside)
        TitleView.titleEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0)
        TitleView.imageEdgeInsets = UIEdgeInsetsMake(0, 47, 0, 0)
        self.navigationItem.titleView = TitleView
        
        mainTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT - 64 ), style: .plain)
        mainTableView.dataSource = self;
        mainTableView.delegate = self;
        mainTableView.estimatedRowHeight = 143 * kSCREEN_SCALE;
        mainTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: identyfierTable1)
        self.view.addSubview(mainTableView)
    }
    
    //  Click the title Button
    @objc func chooseAction(sender:UIButton) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: identyfierTable1, for: indexPath) as! TableViewCell
        cell.selectionStyle = .default
        
        var num = Int(arc4random_uniform(6))+1
        if num == 0 {
            num = 7
        }
        if indexPath.row == 0 {
            num = 8
        }
        cell.assignToViews(num: num)
        cell.showImageAction = {
            self.theImage = $2
            self.theIndex = $0
            let BrowserView = ImageBrowser()
            BrowserView.delegate = self
            //  Click the direct superview of the imageView
            BrowserView.bottomView = cell.viewWithTag(10086)
            //  Click Picture postion in the array list
            BrowserView.indexImage = $0
            BrowserView.defaultImage = $2
            BrowserView.arrayImage = $1 as! [String]
            BrowserView.show()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    //    #MARK:HJImageBrowserDelegate
    func GetTheThumbnailImage(_ indexRow: Int) -> UIImage {
        //  Click the image and have a full view to look picture
        return theImage
    }
    
}
