//
//  ContentView.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/15.
//

import SwiftUI

struct WhereVaccineView: View {
    @ObservedObject var document: WhereVaccineDocument
    @State private var showSomething = false
    @State private var show = false
    @State private var showProject = false
    @State private var showSites = false
    
    @State var selected_sido: String?
    @State var selected_sigungu: String?

    init(document: WhereVaccineDocument){
        self.document = document
    }
    

    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Text("백신 접종센터 찾기").font(.headline).padding()
                HStack{
                    Spacer()
                    Button(action: {
                        self.showSomething = true
                    }, label: { Text("주변에서 찾기")}).padding()
                }
            }
            Form{
                Picker("시/도", selection: $selected_sido){
                    Text("선택").tag(String?.none)
                    ForEach(document.sido.map{ String($0) }, id: \.self){ (sido: String?) in
                        Text("\(sido ?? "선택")").tag(sido)
                    }
                }
                Picker("시/군/구", selection: $selected_sigungu){
                    Text("선택").tag(String?.none)
                    ForEach(document.seoulSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                        Text("\(sigungu ?? "선택")").tag(sigungu)
                    }
                }
                Button("검색"){
                    //정한 정보를 넘겨주기
                }
            }
                   
        }
    }
}
