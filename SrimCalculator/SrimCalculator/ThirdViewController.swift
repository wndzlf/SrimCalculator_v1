//
//  ThirdViewController.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/18.
//  Copyright © 2020 최원석. All rights reserved.
//

import UIKit
import SwiftDataTables

class ThirdViewController: UIViewController {
    
    
    lazy var dataTable = makeDataTable()
    //    var dataTable: SwiftDataTable?
    var dataSource: DataTableContent = []
    //    var finacialDataSource: [FinalFinancialData] = []
    let headerTitles = ["매출액", "영업이익", "당기순이익", "EPS"]
    
    var corpCode: String?
    var corpName: String?
    var salesAccount: String?
    var businessProfits: String?
    var netIncome: String?
    var EPS: String?
    
    private let APIInstanceClass = APIClass()
    
    //    init() {
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    //    let dataExample: [DataTableValueType] = [DataTableValueType(5.5), DataTableValueType(3), DataTableValueType("ㅋㅋㅋㅋ")]
    //
    //    func numberOfColumns(in: SwiftDataTable) -> Int {
    //        return 4
    //    }
    //
    //    func numberOfRows(in: SwiftDataTable) -> Int {
    //        return 3
    //    }
    //
    //    func dataTable(_ dataTable: SwiftDataTable, dataForRowAt index: NSInteger) -> [DataTableValueType] {
    //        return dataExample
    //    }
    //
    //    func dataTable(_ dataTable: SwiftDataTable, headerTitleForColumnAt columnIndex: NSInteger) -> String {
    //        return "안녕"
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        dataTable?.dataSource = self
        //        dataTable?.delegate = self
        
        setupViews()
        setupConstraints()
        setupAPIData()
        addDataSourceAfter()
        //        addDataSourceAfter()
        
        //        let a = DataTableConfiguration()
        //
        //        self.dataTable = SwiftDataTable(dataSource: self,
        //                                        options: a,
        //                                        frame: CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height))
        //        self.dataTable?.backgroundColor = .red
        //
        //
        //        self.view.addSubview(self.dataTable!)
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupViews() {
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.isTranslucent = false
        title = "Streaming fans"
        view.backgroundColor = UIColor.red
        view.addSubview(dataTable)
        dataTable.reload()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dataTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            dataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            dataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setupAPIData() {
        APIInstanceClass.APIfunctionForFinancialStatements(corpCode: self.corpCode ?? "") { financialData in
            for factor in financialData {
                if factor.accountNm == "수익(매출액)" {
                    self.salesAccount = factor.thstrmAmount
                    print(self.salesAccount ?? "")
                    
                } else if factor.accountNm == "영업이익(손실)"  {
                    self.businessProfits = factor.thstrmAmount
                    print(self.businessProfits ?? "")
                    
                } else if factor.accountNm == "당기순이익(손실)" && factor.sjNm == "손익계산서" {
                    self.netIncome = factor.thstrmAmount
                    print(self.netIncome ?? "")
                    
                } else if factor.accountNm == "기본주당이익(손실)" {
                    self.EPS = factor.thstrmAmount
                    print(self.EPS ?? "")
                    
                }
            }
        }
    }
    
    
    public func addDataSourceAfter(){
        
        self.dataSource = [
            [
                DataTableValueType.string(salesAccount ?? ""),
                DataTableValueType.string(businessProfits ?? ""),
                DataTableValueType.string(netIncome ?? ""),
                //                DataTableValueType.string("Be a game publisher"),
                DataTableValueType.string(EPS ?? "")
//            ],
//            [
//                DataTableValueType.string("NoelDavies"),
//                DataTableValueType.string("Water"),
//                DataTableValueType.string("Php and Javascript"),
//                //                DataTableValueType.string("'Be a fucking paratrooper machine'"),
//                DataTableValueType.float(185.80)
//            ],
//            [
//                DataTableValueType.string("Redsaint"),
//                DataTableValueType.string("Cheerwine and Dr.Pepper"),
//                DataTableValueType.string("Java"),
//                //                DataTableValueType.string("'Creating an awesome RPG Game game'"),
//                DataTableValueType.float(185.42)
            ]
        ]
        dataTable.reload()
    }
    
}

extension ThirdViewController {
    private func makeDataTable() -> SwiftDataTable {
        let dataTable = SwiftDataTable(dataSource: self)
        dataTable.translatesAutoresizingMaskIntoConstraints = false
        dataTable.delegate = self
        return dataTable
    }
}

extension ThirdViewController: SwiftDataTableDataSource {
    func numberOfColumns(in: SwiftDataTable) -> Int {
        return self.headerTitles.count
    }
    
    func numberOfRows(in: SwiftDataTable) -> Int {
        return self.dataSource.count
    }
    
    func dataTable(_ dataTable: SwiftDataTable, dataForRowAt index: NSInteger) -> [DataTableValueType] {
        return self.dataSource[index]
    }
    
    func dataTable(_ dataTable: SwiftDataTable, headerTitleForColumnAt columnIndex: NSInteger) -> String {
        return self.headerTitles[columnIndex]
    }
}

extension ThirdViewController: SwiftDataTableDelegate {
    func didSelectItem(_ dataTable: SwiftDataTable, indexPath: IndexPath) {
        debugPrint("did select item at indexPath: \(indexPath) dataValue: \(dataTable.data(for: indexPath))")
    }
}
