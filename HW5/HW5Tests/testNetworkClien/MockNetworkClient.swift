//
//  MockNetworkClient.swift
//  HW5Tests
//
//  Created by Ponomarev Maksim on 26.08.2022.
//

@testable import HW5
import Foundation

final class MockNetworkClient<R>: NetworkClient {

    enum MockNetworkClientError: Error {
        case stubError
    }

    typealias Response = R
    typealias Completion = (Response?, Error?) -> ()

    var stubError: Bool = false
    var stubResponse: R?
    
    func networkRequest<P: Codable>(params: P, completion: @escaping Completion) {
        if stubError {
            completion(nil, MockNetworkClientError.stubError)
        } else {
            completion(stubResponse, nil)
        }
    }
}
