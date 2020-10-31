//
//  FourthViewController.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/24.
//  Copyright © 2020 최원석. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var salesAccountLabel: UILabel!
    @IBOutlet weak var businessProfitsLabel: UILabel!
    @IBOutlet weak var netIncomeLabel: UILabel!
    @IBOutlet weak var EPSLabel: UILabel!
    
    var corpName: String?
    var corpCode: String?
    var dataArry: [FinancialStatementsList] = []
    var salesAccount: String?
    var businessProfits: String?
    var netIncome: String?
    var EPS: String?
    
    private let APIInstanceClass = APIClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if corpName?.isEmpty == false {
            print("데이터가 넘어왔습니다.")
        } else {
            print("데이터가 넘어오지않았습니다.")
        }
        
        APIInstanceClass.APITestfunction { financialData in
            for factor in financialData {
                if factor.accountNm == "수익(매출액)" {
                    self.salesAccount = factor.thstrmAmount
                    print(self.salesAccount ?? "")
                    DispatchQueue.main.async {
                        self.salesAccountLabel.text = self.salesAccount
                    }
                } else if factor.accountNm == "영업이익(손실)"  {
                    self.businessProfits = factor.thstrmAmount
                    print(self.businessProfits ?? "")
                    DispatchQueue.main.async {
                        self.businessProfitsLabel.text = self.businessProfits
                    }
                } else if factor.accountNm == "당기순이익(손실)" && factor.sjNm == "손익계산서" {
                    self.netIncome = factor.thstrmAmount
                    print(self.netIncomeLabel ?? "")
                    DispatchQueue.main.async {
                        self.netIncomeLabel.text = self.netIncome
                    }
                } else if factor.accountNm == "기본주당이익(손실)" {
                    self.EPS = factor.thstrmAmount
                    print(self.EPS ?? "")
                    DispatchQueue.main.async {
                        self.EPSLabel.text = self.EPS
                    }
                }
            }
        }
    }
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
