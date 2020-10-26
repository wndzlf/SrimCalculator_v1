//
//  ThirdViewController.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/18.
//  Copyright © 2020 최원석. All rights reserved.
//

import UIKit
import SwiftDataTables

class ThirdViewController: UIViewController, SwiftDataTableDelegate, SwiftDataTableDataSource {
    
    var corpName: String?
    
    let dataExample: [DataTableValueType] = [DataTableValueType(5.5), DataTableValueType(3), DataTableValueType("ㅋㅋㅋㅋ")]
    
    func numberOfColumns(in: SwiftDataTable) -> Int {
        return 1
    }
    
    func numberOfRows(in: SwiftDataTable) -> Int {
        return 3
    }
    
    func dataTable(_ dataTable: SwiftDataTable, dataForRowAt index: NSInteger) -> [DataTableValueType] {
        return dataExample
    }
    
    func dataTable(_ dataTable: SwiftDataTable, headerTitleForColumnAt columnIndex: NSInteger) -> String {
        return "안녕"
    }
    
    private var dataTabe: SwiftDataTable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let a = DataTableConfiguration()
        self.dataTabe = SwiftDataTable(dataSource: self,
                                       options: a,
                                       frame: CGRect(x: 50, y: 50, width: 200, height: 100))
        self.dataTabe?.backgroundColor = .red
        
        
        self.view.addSubview(self.dataTabe!)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataTabe?.dataSource = self
        dataTabe?.delegate = self
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


