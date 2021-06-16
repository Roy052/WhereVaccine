//
//  WhereVaccineViewMain.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/22.
//

import SwiftUI

struct WhereVaccineViewMain: View {
    let whereVaccineDocument = WhereVaccineDocument()
    @State var selected_sido:String?
    @State var selected_sigungu:String?
    
    @ViewBuilder
    var body: some View {
        //로딩중일 때
        if self.isLoading {
            WhereVaccineViewLoading()
        }
        //로딩이 끝났을 때
        else{
            VStack(){
                NavigationView{
                    HStack{
                        NavigationLink(
                            destination: WhereVaccineView(document: whereVaccineDocument,selected_sido: self.$selected_sido, selected_sigungu: self.$selected_sigungu),
                            label: {
                                ZStack{
                                    Image("VaccineInfo")
                                        .resizable()
                                        .scaledToFit()
                                }   
                            })
                            .navigationBarTitle("어디 백신")
                        NavigationLink(
                            destination: WhereVaccineCOVIDView(),
                            label: {
                                ZStack{
                                    Image("COVIDInfo")
                                        .resizable()
                                        .scaledToFit()
                                }
                        })
                    }
                }
            }
        }
    }
    
    //loading 확인 변수
    var isLoading: Bool{
        whereVaccineDocument.backgroundURL != nil
    }
}
