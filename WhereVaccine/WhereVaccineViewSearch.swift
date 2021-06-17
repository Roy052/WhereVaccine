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

class WhereVaccineSearchDocument: ObservableObject{
    var datas = [Response]()
    var selected_sido:String
    var selected_sigungu:String
    
    init(selected_sido: String, selected_sigungu: String){
        
        self.selected_sido = selected_sido
        self.selected_sigungu = selected_sigungu
        getVaccData(selected_sido, selected_sigungu, 0, 10){ data in
            self.datas = data.result
            
        }
    }
    
}
     
struct VaccineCenterList: View {
    var selected_sido:String
    var selected_sigungu:String
    @ObservedObject var document: WhereVaccineSearchDocument
    var datas = [Response]()
    
    init(selected_sido: String, selected_sigungu: String){
        self.selected_sido = selected_sido
        self.selected_sigungu = selected_sigungu
        document = WhereVaccineSearchDocument(selected_sido: selected_sido, selected_sigungu: selected_sigungu)
        self.datas = document.datas
    }
        
    var body: some View {
        List{
//            Text(datas[0].orgnm)
            ForEach(document.datas,id:\.self){ center in
                VaccineCenterListEntry(center: center)
                
            }
            Button(action: {print(document.datas[0].orgnm)}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}
    
struct VaccineCenterListEntry: View {
        var center: Response
        init(center: Response) {
            self.center = center
        }
    
        var body: some View {
            Text(center.orgnm)
        }
}

