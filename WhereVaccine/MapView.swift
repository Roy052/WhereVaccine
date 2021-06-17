//
//  MapView.swift
//  WhereVaccine
//
//  Created by Jin Youn on 2021/06/17.
//

import SwiftUI
import Combine
import MapKit

struct MapView: View {
    @State private var locationManager = LocationManager(){
        willSet{
            let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
            region.center.latitude = coordinate.latitude
            region.center.longitude = coordinate.longitude
        }
    }
    var document:WhereVaccineSearchDocument
    @State private var locations: [Location] = Location.getLocation()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.8889591, longitude: 128.6095541), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    init(document: WhereVaccineSearchDocument){
        self.document = document
        locations = Location.getDataLocation(data: document.mapDatas)
        for i in 0..<locations.count{
            print(locations[i].coordinate)
        }
    }

    @ViewBuilder
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent:  { (location) -> MapPin in
            MapPin(coordinate: location.coordinate, tint: .green)
        }).edgesIgnoringSafeArea(.all)
        HStack{
            Button(action: {
                locationManager = LocationManager()
            }, label: {
                Text("내 위치로")
            })
            Button(action: {
                locations = Location.getDataLocation(data: document.mapDatas)
            }, label: {
                Text("위치 표시")
            })
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(document: WhereVaccineSearchDocument(selected_sido: "대구광역시", selected_sigungu: "북구"))
    }
}
