//
//  NetworkP1Service.swift
//  HW5
//
//  Created by Ponomarev Maksim on 25.08.2022.
//

import Foundation

protocol Networkp1Service {
    
    func fetchData(urlString: String) async -> [SomeObject]
}

class Networkp1ServiceImp: Networkp1Service {
    
    func fetchData(urlString: String) async -> [SomeObject] {
        let url = URL(string: urlString)!
        let urlSession = URLSession.shared
        do {
            let (data, _) = try! await urlSession.data(from: url)
            let decodedData = try JSONDecoder().decode(ServerP1Response.self, from: data)
            return decodedData
        } catch(let error) {
            debugPrint("Error handling", error.localizedDescription )
        }
        return []
    }
    
}
