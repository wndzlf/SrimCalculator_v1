//
//  ViewController.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/16.
//  Copyright © 2020 최원석. All rights reserved.
//

import UIKit

class searchCorpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchCoperationTextField: UITextField!
    //
    //    var corpCodeStruct: [CorpCodeStruct] = []
    //    var result: [Result] = []
    //    var list: [List] = []
    var dataString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        let jsonDecoder: JSONDecoder = JSONDecoder()
        //        guard let dataAsset: NSDataAsset = NSDataAsset(name: "CorpCodeJsonData") else {
        //            return print("we don't have the data")
        //        }
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "CorpCodeJsonData" ) else {
            return
        }
        
        print(dataAsset.data)
    
        dataString = String(data: dataAsset.data, encoding: .utf16)
        print(self.dataString ?? "we don't have string data")
        
        
        //        do {
        //            let dataCorpStruct = try jsonDecoder.decode(CorpCodeStruct.self, from: dataAsset.data)
        //            let dataResult = dataCorpStruct.result
        //            let dataList = dataResult.list
        //            self.list = dataList
        //
        //        } catch {
        //            print(error.localizedDescription)
        //        }
    }
    
    @IBAction func clickSearchButton(_ sender: UIButton) {
        
        if let dataString = self.dataString, dataString.contains(self.searchCoperationTextField.text ?? "") {
            guard let fourthViewController = storyboard?.instantiateViewController(identifier: "FourthViewController") as? FourthViewController else {
                return
            }
            
            fourthViewController.corpName = self.searchCoperationTextField.text
            self.navigationController?.pushViewController(fourthViewController, animated: true)
        } else {
            let alertController = UIAlertController(title: "알림창", message: "기업 이름을 입력해주세요!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "경고", style: .destructive, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        
        //        if self.searchCoperationTextField.text != "" {
        //            for listFactor in list {
        //                if listFactor.corpName.first == self.searchCoperationTextField.text {
        //                    guard let fourthViewController = storyboard?.instantiateViewController(identifier: "FourthViewController") as? FourthViewController else {
        //                        return
        //                    }
        //                    fourthViewController.corpName = listFactor.corpName.first
        //                    fourthViewController.corpCode = listFactor.corpCode.first
        //                }
        //            }
        //        } else {
        //            let alertController = UIAlertController(title: "알림창", message: "기업 이름을 입력해주세요!", preferredStyle: .alert)
        //            alertController.addAction(UIAlertAction(title: "경고", style: .destructive, handler: nil))
        //            self.present(alertController, animated: true, completion: nil)
        //        }
    }
}


//        if let dataString = self.dataString,
//           dataString.contains(self.searchCoperationTextField.text ?? "") {
//            guard let thirdViewController = storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else {
//                return
//            }
//
//            thirdViewController.corpName = self.searchCoperationTextField.text
//            self.navigationController?.pushViewController(thirdViewController, animated: true)
//        } else {
//            let alertController = UIAlertController(title: "알림창", message: "기업 이름을 입력해주세요!", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "경고", style: .destructive, handler: nil))
//            self.present(alertController, animated: true, completion: nil)
//        }



