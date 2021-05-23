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
                    Text("서울")
                    Text("대구")
                }
            }
        }
    }
}
