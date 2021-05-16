//
//  ContentView.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/15.
//

import SwiftUI

struct WhereVaccineView: View {
    @ObservedObject var document: WhereVaccineDocument

    init(document: WhereVaccineDocument){
        self.document = document
    }

    
    var body: some View {
        Text("Hello, world!!")
            .padding()
    }
}
