//
//  WhereVaccineViewSearch.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/06/16.
//

import SwiftUI

struct WhereVaccineViewSearch: View {
    var selected_sido: String
    var selected_sigungu: String

    init(selected_sido:String, selected_sigungu:String) {
        self.selected_sido = selected_sido
        self.selected_sigungu = selected_sigungu
    }
    
    var body: some View {
        VaccineCenterList(selected_sido: selected_sido, selected_sigungu: selected_sigungu)
    }
}
     
struct VaccineCenterList: View {
    var selected_sido:String
    var selected_sigungu:String
    var datas = [""]
    
    init(selected_sido: String, selected_sigungu: String){
        getVaccData(selected_sido, selected_sigungu, 0, 10){ data in
            for i in 0..<10 {
                print(data.result[i].orgnm)
            }
        }
        self.selected_sido = selected_sido
        self.selected_sigungu = selected_sigungu
    }
        
    var body: some View {
        List{
            FlightListEntry(orgnm: "abc")
        }
    }
    
    
}
    
struct FlightListEntry: View {
        
    
        var orgnm: String
        init(orgnm: String) {
            self.orgnm = orgnm
        }
    
        var body: some View {
            Text(orgnm)
        }
}

