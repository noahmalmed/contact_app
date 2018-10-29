//
//  ContactTest.swift
//  ContactsTests
//
//  Created by Noah Malmed on 10/28/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import XCTest

class ContactTest: XCTestCase {
    
    func testFullData() {
        // Pull data
        guard let path = Bundle(for: type(of: self)).path(forResource: "full_contact_data", ofType: "json") else {
            // Handle error
            XCTFail("Path to directory JSON not found")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let contact = try JSONDecoder().decode(Contact.self, from: jsonData)
            verify(contact: contact, id: 1, firstName: "test_first", lastName: "test_last", email: "test_email", gender: "test_gender", phone: "test_phone", department: "test_department", jobTitle: "test_jobTitle", address: "test_address", city: "test_city")
        } catch {
            XCTFail("Json can't be parsed")
        }
    }
    
    func testWithMissingOptionals() {
        // Pull data
        guard let path = Bundle(for: type(of: self)).path(forResource: "contact_missing_optionals", ofType: "json") else {
            // Handle error
            XCTFail("Path to directory JSON not found")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let contact = try JSONDecoder().decode(Contact.self, from: jsonData)
            verify(contact: contact, id: 1, firstName: "test_first", lastName: "test_last", email: "test_email", gender: nil, phone: "test_phone", department: "test_department", jobTitle: "test_jobTitle", address: "test_address", city: nil)
        } catch {
            XCTFail("Json can't be parsed")
        }
    }
    
    func testWithMissingNonOptionals() {
        // Pull data
        guard let path = Bundle(for: type(of: self)).path(forResource: "contact_missing_non_optionals", ofType: "json") else {
            // Handle error
            XCTFail("Path to directory JSON not found")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let _ = try JSONDecoder().decode(Contact.self, from: jsonData)
            XCTFail("Shouldn't be able to decode this json")
        } catch {
            
        }
    }
    
    private func verify(contact: Contact, id: Int, firstName: String, lastName: String, email: String, gender: String?, phone: String, department: String, jobTitle: String, address: String, city: String?) {
        XCTAssertEqual(contact.id, id)
        XCTAssertEqual(contact.firstName, firstName)
        XCTAssertEqual(email, email)
        XCTAssertEqual(contact.gender, gender)
        XCTAssertEqual(contact.phone, phone)
        XCTAssertEqual(contact.department, department)
        XCTAssertEqual(contact.jobTitle, jobTitle)
        XCTAssertEqual(contact.address, address)
        XCTAssertEqual(contact.city, city)
    }
    
}
