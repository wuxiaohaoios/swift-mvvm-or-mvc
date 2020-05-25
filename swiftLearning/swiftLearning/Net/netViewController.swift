//
//  netViewController.swift
//  swiftLearning
//
//  Created by Emma on 2020/5/25.
//  Copyright © 2020 Emma. All rights reserved.
//

import UIKit

class netViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataByMoya()
        loadDataByChain()
        loadDataByAFN()

        // Do any additional setup after loading the view.
    }
    
    /// moya请求
       func loadDataByMoya() {
           HttpRequest.loadData(target: DMAPI.rankList, needCache: false, success: { (json) in
               let decoder = JSONDecoder()
               let model = try? decoder.decode(DMModel.self, from: json)
//               self.model = model
//               self.tableView.reloadData()
           }, failure: nil)

       }
       
       /// 链式请求
       func loadDataByChain() {
           NetworkKit().url("http://app.u17.com/v3/appV3_3/ios/phone/rank/list").requestType(.post).success { (json) in
               let decoder = JSONDecoder()
               let model = try? decoder.decode(DMModel.self, from: json)
//               self.model = model
//               self.tableView.reloadData()
               
               }.failure { (state_code, message) in
                   
               }.request()
       }
       
       /// 类AFN请求
       func loadDataByAFN() {
           NetworkTools.POST(url: "http://app.u17.com/v3/appV3_3/ios/phone/rank/list", params: nil, success: { (json) in
               let decoder = JSONDecoder()
               let model = try? decoder.decode(DMModel.self, from: json)
            print(model)
//               self.model = model
//               self.tableView.reloadData()
           }) { (state_code, message) in
               
           }
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
