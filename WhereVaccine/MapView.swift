//
//  MapView.swift
//  WhereVaccine
//
//  Created by Jin Youn on 2021/06/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var locationManager = LocationManager()
    var document:WhereVaccineSearchDocument
    var latitude:Double{
        return locationManager.lastLocation?.coordinate.latitude ?? 0
    }
    var longtitude:Double{
        return locationManager.lastLocation?.coordinate.longitude ?? 0
    }
    @State private var locations: [Location] = Location.getLocation()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.8889591, longitude: 128.6095541), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    init(document: WhereVaccineSearchDocument){
        self.document = document
        locations = Location.getDataLocation(data: document.mapDatas)
        for i in 0..<locations.count{
            print(locations[i].coordinate)
        }
        print(String(latitude))
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent:  { (location) -> MapPin in
            MapPin(coordinate: location.coordinate, tint: .green)
        }).edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(document: WhereVaccineSearchDocument(selected_sido: "대구광역시", selected_sigungu: "북구"))
    }
}
