//
//  WhereVaccine.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/16.
//

import Foundation

struct WhereVaccine: Codable {
    var backgroundURL: URL?
    var socialDistanceURL: URL?
    var sido = ["서울특별시","부산광역시","대구광역시","인천광역시","광주광역시","대전광역시","울산광역시","세종특별자치시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도",
        "제주특별자치도"]
    var seoulSigungu = ["종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구"].sorted()
    
    var json: Data?{
            return try? JSONEncoder().encode(self)
        }
        
        init?(json: Data?){
            if json != nil, let newWhereVaccine = try? JSONDecoder().decode(WhereVaccine.self, from: json!){
                self = newWhereVaccine
            } else {
                return nil
            }
        }
        
        init() { }
}
