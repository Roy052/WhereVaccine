//
//  WhereVaccineCOVIDView.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/23.
//

import SwiftUI

struct WhereVaccineCOVIDView: View {
    var url = "http://ncov.mohw.go.kr/regSocdisBoardView.do"
    
    var body: some View {
            Button(action: {
                if let url = URL(string: url){
                    UIApplication.shared.open(url, options: [:])
                }
            }, label: {
                Text("사회적 거리두기 정보 링크")
            })
            
    }
}

