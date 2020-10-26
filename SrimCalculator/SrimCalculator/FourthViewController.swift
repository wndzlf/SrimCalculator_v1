//
//  FourthViewController.swift
//  SrimCalculator
//
//  Created by 최원석 on 2020/10/24.
//  Copyright © 2020 최원석. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    var corpName: String?
    var corpCode: String?
    let mycrtfcKey: String = "28223d93326101b760b633b7ab5469df600a465f"
    var dataArry: [SecondList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if corpName?.isEmpty == false {
            print("데이터가 넘어왔습니다.")
        } else {
            print("데이터가 넘어오지않았습니다.")
        }
        var baseURL: String = "https://opendart.fss.or.kr/api/fnlttSinglAcntAll.json"
        
        //        let MakedURL = baseURL + " " + " "
//        let testMakedURL = baseURL + "?crtfc_key=\(mycrtfcKey)" + "&corp_code=00126380" + "&bsns_year=2019" + "&reprt_code=11011" + "fs_div=OFS"
        let anothertestURL :String = "https://opendart.fss.or.kr/api/fnlttSinglAcntAll.json?crtfc_key=28223d93326101b760b633b7ab5469df600a465f&corp_code=00126380&bsns_year=2019&reprt_code=11011&fs_div=OFS"
        
        guard let url = URL(string: anothertestURL) else {return}
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) {(datas, response, error) in
            if error != nil {
                print("Network Error")
            }
            guard let data = datas else {return}
            
            do {
                let order = try JSONDecoder().decode(Welcome.self, from: data)
                self.dataArry = order.list
            } catch {
                print("JSON Parising Error")
            }
        }
        dataTask.resume()
    }
}
