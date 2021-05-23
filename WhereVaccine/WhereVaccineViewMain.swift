//
//  WhereVaccineViewMain.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/22.
//

import SwiftUI

struct WhereVaccineViewMain: View {
    let whereVaccineDocument = WhereVaccineDocument()
    var body: some View {
        VStack(spacing: 0){
            Text("어디 백신").font(Font.headline)
            NavigationView{
                HStack{
                    NavigationLink(
                        destination: WhereVaccineView(document: whereVaccineDocument),
                        label: {
                            ZStack{
                                Rectangle().padding(13)
                                    .aspectRatio(1.0, contentMode: .fit)

                                Rectangle().padding()
                                    .aspectRatio(1.0, contentMode: .fit)
                                    .foregroundColor(Color.white)
                                Text("백신 접종 센터 정보")
                            }
                        })
                    NavigationLink(
                        destination: WhereVaccineCOVIDView(),
                        label: {
                            ZStack{
                                Rectangle().padding(13)
                                    .aspectRatio(1.0, contentMode: .fit)

                                Rectangle().padding()
                                    .aspectRatio(1.0, contentMode: .fit)
                                    .foregroundColor(Color.white)
                                Text("코로나19 정보")
                            }
                        })
                    
                }
                
            }
        }
    }
}
