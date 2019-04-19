//
//  Test2ViewController.swift
//  SupChats
//
//  Created by QJY on 2019/3/25.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    
    var Pass=String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text=Pass
        print(Pass)
        // Do any additional setup after loading the view.
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
