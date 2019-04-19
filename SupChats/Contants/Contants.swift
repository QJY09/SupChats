//
//  Contants.swift
//  SupChats
//
//  Created by QJY on 05/09/2018.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit

class Contants: UIViewController {

    @IBOutlet weak var AddFriendBTN: UIBarButtonItem!
    @IBAction func AddFriendAction(_ sender: UIBarButtonItem) {
        print("Click Add Friend BTN on Contants")
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "AddFriendViewControllerID")as! UIViewController, animated: true)    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
