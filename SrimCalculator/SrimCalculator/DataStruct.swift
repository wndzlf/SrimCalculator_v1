//
//  DataStruct.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/24.
//  Copyright © 2020 최원석. All rights reserved.
//

import Foundation


// MARK: - CorpCodeStruct
struct CorpCodeStruct: Codable {
    let result: SearchCorpNameResult
}

// MARK: - SearchCorpNameResult
struct SearchCorpNameResult: Codable {
    let list: [SearchCorpNameList]
}

// MARK: - SearchCorpNameList
struct SearchCorpNameList: Codable {
    let corpCode, corpName, stockCode, modifyDate: [String]

    enum CodingKeys: String, CodingKey {
        case corpCode = "corp_code"
        case corpName = "corp_name"
        case stockCode = "stock_code"
        case modifyDate = "modify_date"
    }
}

// MARK: - SearchFinancialStatementsResult
struct SearchFinancialStatementsResult: Codable {
    let status, message: String
    let list: [FinancialStatementsList]
}

// MARK: - FinancialStatementsList
struct FinancialStatementsList: Codable {
    let rceptNo, reprtCode, bsnsYear, corpCode: String
    let sjDiv, sjNm, accountID, accountNm: String
    let accountDetail, thstrmNm, thstrmAmount, frmtrmNm: String
    let frmtrmAmount, bfefrmtrmNm, bfefrmtrmAmount, ord: String

    enum CodingKeys: String, CodingKey {
        case rceptNo = "rcept_no"
        case reprtCode = "reprt_code"
        case bsnsYear = "bsns_year"
        case corpCode = "corp_code"
        case sjDiv = "sj_div"
        case sjNm = "sj_nm"
        case accountID = "account_id"
        case accountNm = "account_nm"
        case accountDetail = "account_detail"
        case thstrmNm = "thstrm_nm"
        case thstrmAmount = "thstrm_amount"
        case frmtrmNm = "frmtrm_nm"
        case frmtrmAmount = "frmtrm_amount"
        case bfefrmtrmNm = "bfefrmtrm_nm"
        case bfefrmtrmAmount = "bfefrmtrm_amount"
        case ord
    }
}


//struct FinalFinancialData {
//    var salesAccount: String
//    var businessProfits: String
//    var netIncome: String
//    var EPS: String
//}
