//
//  Contact.swift
//  Contacts
//
//  Created by Noah Malmed on 10/25/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

public struct Contact: Equatable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let email: String
    // Make this into an enum
    public let gender: String?
    public let phone: String
    public let department: String
    public let jobTitle: String
    public let address: String
    public let city: String?
    
    public var fullName: String {
        return self.firstName + " " + self.lastName
    }
}

extension Contact: Decodable {
    enum MyStructKeys: String, CodingKey { // declaring our keys
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
        case gender = "gender"
        case phone = "phone"
        case department = "department"
        case jobTitle = "jobTitle"
        case address = "address"
        case city = "city"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self) // defining our (keyed) container
        let id = try container.decode(Int.self, forKey: .id)
        let firstName = try container.decode(String.self, forKey: .firstName)
        let lastName = try container.decode(String.self, forKey: .lastName)
        let email = try container.decode(String.self, forKey: .email)
        let gender = try container.decode(String?.self, forKey: .gender)
        let phone = try container.decode(String.self, forKey: .phone)
        let department = try container.decode(String.self, forKey: .department)
        let jobTitle = try container.decode(String.self, forKey: .jobTitle)
        let address = try container.decode(String.self, forKey: .address)
        let city = try container.decode(String?.self, forKey: .city)
        
        self.init(id: id, firstName: firstName, lastName: lastName, email: email, gender: gender, phone: phone, department: department, jobTitle: jobTitle, address: address, city: city)
    }
}
