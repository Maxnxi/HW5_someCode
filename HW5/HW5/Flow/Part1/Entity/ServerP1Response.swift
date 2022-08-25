//
//  ServerP1Response.swift
//  HW5
//
//  Created by Ponomarev Maksim on 25.08.2022.
//

import Foundation

typealias ServerP1Response = [SomeObject]

struct SomeObject: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}

