//
//  Model.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 19/08/2022.
//

import Foundation

struct Results: Decodable{
    var results: [User]?
}

struct User: Decodable{
    var gender: String?
    var name: Name?
    var location: Location?
    var email: String?
    var dob: DateOfBirth?
    var phone: String?
    var picture: Picture?
}

struct Name: Decodable{
    var first: String?
    var last: String?
}

struct Location: Decodable{
    var street: Street?
    var city: String?
    var state: String?
    var country: String?
}

struct DateOfBirth: Decodable{
    var date: Date?
    var age: Int?
}

struct Street: Decodable{
    var number: Int?
    var name: String?
}

struct Picture: Decodable{
    var large: String?
    var thumbnail: String?
}
