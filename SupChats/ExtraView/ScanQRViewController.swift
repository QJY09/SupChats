//
//  ScanQRViewController.swift
//  SupChats
//
//  Created by QJY on 2019/2/23.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit
import swiftScan

class ScanQRViewController: LBXScanViewController {
    //Open iphone Flash
    @IBOutlet weak var OpenFlashBTN: UIButton!
    var IsFlashOn = false
    @IBAction func OpenFlashActive(_ sender: UIButton) {
        IsFlashOn = !IsFlashOn
        scanObj?.changeTorch()
        if IsFlashOn{
            OpenFlashBTN.setImage(UIImage(named:"Flash-Blue" ), for: .normal)
            FlashLable.text="Close Flash"
            FlashLable.textColor=UIColor.init(red: 107, green: 208, blue: 255, alpha: 100)
        }else{
            OpenFlashBTN.setImage(UIImage(named: "Flash-White"), for: .normal)
            FlashLable.text="Open Flash"
            FlashLable.textColor=UIColor.white
        }
    }
    @IBOutlet weak var FlashLable: UILabel!
    @IBOutlet weak var FlashView: UIView!
    
    func ScanQRViewLayout(){
        self.title="Scan QR Code"
        navigationController?.navigationBar.backgroundColor=UIColor.clear
        var ScanStyle=LBXScanViewStyle()
        ScanStyle.anmiationStyle = .NetGrid
        ScanStyle.animationImage=UIImage(named: "CodeScan.bundle/qrcode_scan_light_green@2x")
        scanStyle=ScanStyle
        FlashView.backgroundColor=UIColor.clear
        FlashLable.textColor=UIColor.white
    }
    
    override func handleCodeResult(arrayResult: [LBXScanResult]) {
        if let result=arrayResult.first{
            let QRmsg=result.strScanned
            if SupportFunction.IsValidURL(with: QRmsg!) == true{
                SupportFunction.PopToWebview(on: self , with: QRmsg!)

            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScanQRViewLayout()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.bringSubview(toFront: FlashView)
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
