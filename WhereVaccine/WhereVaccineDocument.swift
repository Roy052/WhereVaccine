//
//  WhereVaccineDocument.swift
//  WhereVaccine
//
//  Created by roy052 on 2021/05/16.
//

import SwiftUI
import Combine

class WhereVaccineDocument: ObservableObject{
    @Published private var whereVaccine: WhereVaccine

    private var autosaveCancellable: AnyCancellable?
        
        private static let untitled = "WhereVaccineDocument.Untitled"
        
        init(){
            whereVaccine = WhereVaccine(json: UserDefaults.standard.data(forKey: WhereVaccineDocument.untitled)) ?? WhereVaccine()
            autosaveCancellable = $whereVaccine.sink{ whereVaccine in
                //print("\(whereVaccine.json?.utf8 ?? "nil")")
                UserDefaults.standard.set(whereVaccine.json, forKey: WhereVaccineDocument.untitled)
            }
            fetchData()
        }

    var backgroundURL: URL? {
            get {
                whereVaccine.backgroundURL
            }
            set {
                whereVaccine.backgroundURL = newValue
                fetchData()
            }
        }

        private var fetchImageCancellabe: AnyCancellable?
        private func fetchData(){
            if let url = self.whereVaccine.backgroundURL{
                fetchImageCancellabe?.cancel()
                fetchImageCancellabe = URLSession.shared.dataTaskPublisher(for: url)
                    .map{ data, URLResponse in UIImage(data: data)}
                    .receive(on: DispatchQueue.main)
                    .replaceError(with: nil)
                //.assign(to: \.backgroundImage, on: self)
            }
        }
}
