//
//  ViewController.swift
//  swiftLearning
//
//  Created by Emma on 2020/5/19.
//  Copyright © 2020 Emma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //button事件语言糖 第一步
        let btn = UIButton(frame: CGRect(x: 100,y: 100,width: 100,height: 100))

        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: .printFire, for: .touchUpInside)
             view.addSubview(btn)
        // Do any additional setup after loading the view.
        
     
    }
//    lazy var label = UILabel().then({
//        $0.text = "label"
//        $0.textColor = .blue
//    })
    //button事件语言糖 第二步
    @objc func printFire() {
          print("fire")
        let parameters = ["cellphone":"123", "messageCodeType":"4"]

                   NetworkTools.POST(url: "http://app.u17.com/v3/appV3_3/ios/phone/rank/list", params: parameters, success: { (json) in
                       let decoder = JSONDecoder()
                       let model = try? decoder.decode(DMModel.self, from: json)
//                    print(model)
        //               self.model = model
        //               self.tableView.reloadData()
                   }) { (state_code, message) in
                       
                   }
    }

}
//button事件语言糖 第三步
private extension Selector {
    
    static let printFire = #selector(ViewController.printFire)
    
}
