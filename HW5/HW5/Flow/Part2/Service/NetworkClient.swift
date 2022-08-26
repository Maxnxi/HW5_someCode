//
//  NetworkClient.swift
//  HW5
//
//  Created by Ponomarev Maksim on 26.08.2022.
//

import Foundation

protocol NetworkClient {

    associatedtype Response

    typealias Completion = (Response?, Error?) -> ()

    func networkRequest<P: Codable>(params: P, completion: @escaping Completion)
}


final class ItemNetworkClient: NetworkClient {

    typealias Response = ItemP2

    func networkRequest<P: Codable>(params: P, completion: @escaping Completion) {
        // здесь происходит реальный сетевой запрос
    }
}


final class NetworkService<C: NetworkClient> {
    
    enum ServiceError: Error {
        case badResponse
    }
    
    typealias Completion = (ItemP2?, Error?) -> ()
    typealias Parameters = [String: Int]
    
    private let client: C
    
    init(client: C) {
        self.client = client
    }
    
    
    func fetchItem(at index: Int, completion: @escaping Completion) {
        let params = ItemP2RequestParams(index: index)
        client.networkRequest(params: params) { (response, error) in
            if let error = error {
                completion(nil, error)
            } else if let item = response as? ItemP2 {
                completion(item, nil)
            } else {
                completion(nil, ServiceError.badResponse)
            }
            
        }
    }
}

