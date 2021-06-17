//
//  MapView.swift
//  WhereVaccine
//
//  Created by Jin Youn on 2021/06/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    var mapDatas:[Response]
    @State private var locations: [Location] = Location.getLocation()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.8889591, longitude: 128.6095541), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    init(mapDatas: [Response]){
        self.mapDatas = mapDatas
        locations = Location.getDataLocation(data: mapDatas)
        for i in 0..<locations.count{
            print(locations[i].coordinate)
        }
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent:  { (location) -> MapPin in
            MapPin(coordinate: location.coordinate, tint: .green)
        }).edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapDatas: [])
    }
}
