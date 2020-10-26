//
//  DataStruct.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/24.
//  Copyright © 2020 최원석. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct CorpCodeStruct: Codable {
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let corpCode, corpName, stockCode, modifyDate: [String]

    enum CodingKeys: String, CodingKey {
        case corpCode = "corp_code"
        case corpName = "corp_name"
        case stockCode = "stock_code"
        case modifyDate = "modify_date"
    }
}



