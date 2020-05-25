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
    lazy var label = UILabel().then({
        $0.text = "label"
        $0.textColor = .blue
    })
    //button事件语言糖 第二步
    @objc func printFire() {
          print("fire")
    }

}
//button事件语言糖 第三步
private extension Selector {
    
    static let printFire = #selector(ViewController.printFire)
    
}
