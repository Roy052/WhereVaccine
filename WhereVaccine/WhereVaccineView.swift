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
    @State private var showSeoul = false
    @State private var show = false
    @State private var showProject = false
    @State private var showSites = false

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
                Section {
                    Menu{
                        //ForEach
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("서울특별시")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("부산광역시")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("대구광역시")
                        })
                    } label: {
                        Text("시 / 도    ")
                    }
                    Menu{
                        //ForEach
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("강남구")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("강동구")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("강북구")
                        })
                    } label: {
                        Text("시 / 군 / 구    ")
                    }
                    Menu{
                        //ForEach
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("개포동")
                        })
                    } label: {
                        Text("읍 / 면 / 동    ")
                    }
                }
            }
        }
    }
}
