//
//  request.swift
//  HTTPTest
//
//  Created by 권은구 on 2021/06/11.
//

import UIKit

struct Response: Codable {
    let dywk: String            //day
//    let endTm: String
    let hldyYn: String
//    let lunchEndTm: String
//    let lunchSttTm: String
    let orgTlno: String         // phone num
    let orgZipaddr: String      // addr
    let orgcd: String
    let orgnm: String           // name
    let slrYmd: String          // date
//    let sttTm: String
    let roadAddr: String        // road addr (from kakao)
    let addr1: String           // sido
    let addr2: String           // sigungu
    let hasAddr: Bool           // does it have lat long
    let x: Double               // long
    let y: Double               // lat
}

struct Ret: Codable {
    let result: [Response]
}

func requestGet(url: String, completionHandler: @escaping (Bool, Any) -> Void){
    guard let url = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        guard let data = data else {
            print("Error: Did not receive data")
            return
        }
        guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        
        let decoder = JSONDecoder()
        guard let output = try? decoder.decode(Ret.self, from: data) else {
            print("Error: JSON Data Parsing failed")
            print(data)
            return
        }
        
        completionHandler(true, output)
    }.resume()
}

func getVaccData(_ sido: String, _ sigungu: String, _ start: Int, _ count: Int, handler: @escaping (Ret) -> Void){
    let url = "http://155.230.52.58:42108/list?addr1=\(sido)&addr2=\(sigungu)&start=\(start)&count=\(count)"
    let encodedString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    print(url)
    requestGet(url: encodedString) { (success, data) in
        let mydata = data as! Ret
        handler(mydata)
    }
}
