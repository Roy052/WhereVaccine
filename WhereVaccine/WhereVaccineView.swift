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
    
    @Binding var selected_sido: String?
    @Binding var selected_sigungu: String?
    
    init(document: WhereVaccineDocument, selected_sido: Binding<String?>, selected_sigungu: Binding<String?>){
        self.document = document
        _selected_sido = selected_sido
        _selected_sigungu = selected_sigungu
    }
    
    var body: some View {
        VStack(spacing: 0.0){
            Form{
                Picker("시/도", selection: $selected_sido){
                    Text("선택").tag(String?.none)
                    ForEach(document.sido.map{ String($0) }, id: \.self){ (sido: String?) in
                        Text("\(sido ?? "선택")").tag(sido)
                    }
                }
                Picker("시/군/구", selection: $selected_sigungu){
                    Text("선택").tag(String?.none)
                    switch selected_sido {
                    case "서울특별시":
                        ForEach(document.seoulSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "부산광역시":
                        ForEach(document.pusanSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "대구광역시":
                        ForEach(document.daeguSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "인천광역시":
                        ForEach(document.incheonSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "광주광역시":
                        ForEach(document.gwangjuSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "대전광역시":
                        ForEach(document.daejeonSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "울산광역시":
                        ForEach(document.ulsanSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "세종특별자치시":
                        ForEach(document.sejongSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "경기도":
                        ForEach(document.gyeongiSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "강원도":
                        ForEach(document.gangwonSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "충청북도":
                        ForEach(document.chungbukSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "충청남도":
                        ForEach(document.chungnamSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "전라북도":
                        ForEach(document.jeonbukSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "전라남도":
                        ForEach(document.jeonnamSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "경상북도":
                        ForEach(document.kyoungbukSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "경상남도":
                        ForEach(document.kyongnamSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    case "제주도":
                        ForEach(document.jejuSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    default:
                        ForEach(document.jejuSigungu.map{ String($0) }, id: \.self){ (sigungu: String?) in
                            Text("\(sigungu ?? "선택")").tag(sigungu)
                        }
                    }
                    
                }
                NavigationLink(
                    destination: WhereVaccineViewSearch(selected_sido: selected_sido ?? "대구광역시", selected_sigungu: selected_sigungu ?? "북구"),
                    label: {
                        Button("검색"){}
                })
            }
            .navigationBarTitle("백신 접종센터 찾기")
        }
    }
}
