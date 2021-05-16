//
//  WhereVaccine.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/16.
//

import Foundation

struct WhereVaccine: Codable {
    var backgroundURL: URL?

    var json: Data?{
            return try? JSONEncoder().encode(self)
        }
        
        init?(json: Data?){
            if json != nil, let newWhereVaccine = try? JSONDecoder().decode(WhereVaccine.self, from: json!){
                self = newWhereVaccine
            } else {
                return nil
            }
        }
        
        init() { }
}
