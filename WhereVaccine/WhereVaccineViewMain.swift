//
//  WhereVaccineViewMain.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/22.
//

import SwiftUI

struct WhereVaccineViewMain: View {
    let whereVaccineDocument = WhereVaccineDocument()
    
    @ViewBuilder
    var body: some View {
        //로딩중일 때
        if self.isLoading {
            WhereVaccineViewLoading()
        }
        //로딩이 끝났을 때
        else{
            VStack(spacing: 0){
                Text("어디 백신").font(Font.headline)
                NavigationView{
                    HStack{
                        NavigationLink(
                            destination: WhereVaccineView(document: whereVaccineDocument),
                            label: {
                                ZStack{
                                    Image("VaccineInfo")
                                        .resizable()
                                        .scaledToFit()
                                }
                            })
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
