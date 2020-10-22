//
//  ViewController.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/16.
//  Copyright © 2020 최원석. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchCoperationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func clickSearchButton(_ sender: UIButton) {
        
        if searchCoperationTextField.text != "" {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let secondViewController = storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else {
                return
            }

            secondViewController.corpName = self.searchCoperationTextField.text
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        } else {
            let alertController = UIAlertController(title: "알림창", message: "기업 이름을 입력해주세요!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "경고", style: .destructive, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

