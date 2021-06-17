//
//  Map.swift
//  WhereVaccine
//
//  Created by Jin Youn on 2021/06/17.
//

import Foundation
import MapKit

struct Location {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
}
 
extension Location: Identifiable { }
 
extension Location {
    static func getLocation() -> [Location] {
        return [
            Location(title: "경북대학교 IT융복합관", coordinate: CLLocationCoordinate2D(latitude: 35.88815336403566, longitude: 128.61142220947556)),
            Location(title: "경북대학교 글로벌프라자", coordinate: CLLocationCoordinate2D(latitude: 35.891862, longitude: 128.611227)),
            Location(title: "경북대학교 공대9호관", coordinate: CLLocationCoordinate2D(latitude: 35.886880, longitude: 128.608654)),
        ]
    }
    
    static func getDataLocation(data: [Response]) -> [Location]{
        var locations = [Location]()
        for i in 0..<data.count {
            locations.append(Location(title: data[i].orgnm, coordinate: CLLocationCoordinate2D(latitude: data[i].x, longitude: data[i].y)))
            //print(data[i].orgnm)
        }
        for i in 0..<locations.count{
            print(locations[i].coordinate)
        }
        return locations
    }
}
