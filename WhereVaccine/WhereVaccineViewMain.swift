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
    var url = "http://ncov.mohw.go.kr/regSocdisBoardView.do"
    
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
                    VStack{
                        HStack{
                            NavigationLink(
                                destination: WhereVaccineView(document: whereVaccineDocument,selected_sido: self.$selected_sido, selected_sigungu: self.$selected_sigungu),
                                label: {
                                    Image("VaccineInfo")
                                        .resizable()
                                        .scaledToFit()
                                })
                                .navigationBarTitle("어디 백신")
                            Button(action: {
                                if let url = URL(string: url){
                                        UIApplication.shared.open(url, options: [:])
                                }
                            }, label: {
                                Image("COVIDInfo")
                                    .resizable()
                                    .scaledToFit()
                            })
                        }
                        NavigationLink(
                            destination: MapView(document: WhereVaccineSearchDocument(selected_sido: "대구광역시", selected_sigungu: "북구")),
                            label: {
                                Image("MapView")
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
