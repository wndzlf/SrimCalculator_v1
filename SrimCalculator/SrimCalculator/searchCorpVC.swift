//
//  ViewController.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/16.
//  Copyright © 2020 최원석. All rights reserved.
//

import UIKit

class searchCorpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var searchCoperationTextField: UITextField!
    
    private var corpCodeStruct: [CorpCodeStruct] = []
    private var result: [SearchCorpNameResult] = []
    private var list: [SearchCorpNameList] = []
    private var dataString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setList()
    }
    
    private func setList() {
        let jsonDecoder:JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "CorpCodeJsonData") else {
            return print("we don't have any data")
        }
        
        do {
            let dataCorpStruct = try jsonDecoder.decode(CorpCodeStruct.self, from: dataAsset.data)
            let dataResult = dataCorpStruct.result
            let dataList = dataResult.list
            self.list = dataList
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func clickSearchButton(_ sender: UIButton) {
        
        guard self.searchCoperationTextField.text != "" else {
            self.showAlert()
            return
        }
        
        var isShowAlert: Bool = true
        
        for factor in list {
            //TODO: for 문 안에서 여러번 push 하는 경우 어떻게 처리할지 고민!
            if factor.corpName.first == self.searchCoperationTextField.text {
                isShowAlert = false
                
                guard let thirdViewController = storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else {
                    return
                }
                thirdViewController.corpName = factor.corpName.first
                thirdViewController.corpCode = factor.corpCode.first
                
                self.navigationController?.pushViewController(thirdViewController, animated: true)
            }
        }
        
        if isShowAlert {
            self.showAlert()
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "알림창", message: "기업 이름을 입력해주세요!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "경고", style: .destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
