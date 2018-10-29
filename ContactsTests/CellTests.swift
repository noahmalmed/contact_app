//
//  CellTests.swift
//  ContactsTests
//
//  Created by Noah Malmed on 10/29/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import XCTest

class CellTests: XCTestCase {
    
    let contact = Contact(id: 1, firstName: "n", lastName: "m", email: "e", gender: "male", phone: "ring", department: "d", jobTitle: "jt", address: "a", city: "c")
    
    func testMasterTableViewCell() {
        guard let cell = Bundle(for: type(of: self)).loadNibNamed("MasterTableViewCell", owner: self, options: nil)?.first as? MasterTableViewCell else {
            XCTFail("Not there")
            return
        }
        
        cell.configureCell(with: contact)
        
        guard let nameLabel = cell.viewWithTag(1) as? UILabel,
            let jobTitleLabel = cell.viewWithTag(2) as? UILabel,
            let departmentLabel = cell.viewWithTag(3) as? UILabel else {
                XCTFail("Tags Not Found")
                return
        }
        
        XCTAssertEqual(nameLabel.text!, contact.fullName)
        XCTAssertEqual(jobTitleLabel.text!, contact.jobTitle)
        XCTAssertEqual(departmentLabel.text!, contact.department)
    }
    
    func testDetailTitleCell() {
        guard let cell = Bundle(for: type(of: self)).loadNibNamed("DetailTitleTableViewCell", owner: self, options: nil)?.first as? DetailTitleTableViewCell else {
            XCTFail("Not there")
            return
        }
        
        cell.configureCell(with: contact)
        
        guard let nameLabel = cell.viewWithTag(1) as? UILabel,
            let cityLabel = cell.viewWithTag(2) as? UILabel else {
                XCTFail("Tags Not Found")
                return
        }
        
        XCTAssertEqual(nameLabel.text!, contact.fullName)
        XCTAssertEqual(cityLabel.text, contact.city)
    }
    
    func testWorkDetailTitleCell() {
        guard let cell = Bundle(for: type(of: self)).loadNibNamed("WorkDetailTableViewCell", owner: self, options: nil)?.first as? WorkDetailTableViewCell else {
            XCTFail("Not there")
            return
        }
        
        cell.configureCell(with: contact)
        
        guard let departmentLabel = cell.viewWithTag(1) as? UILabel,
            let titleLabel = cell.viewWithTag(2) as? UILabel else {
                XCTFail("Tags Not Found")
                return
        }
        
        XCTAssertEqual(departmentLabel.text!, contact.department)
        XCTAssertEqual(titleLabel.text, contact.jobTitle)
    }
    
    func testContactDetailCell() {
        guard let cell = Bundle(for: type(of: self)).loadNibNamed("ContactDetailTableViewCell", owner: self, options: nil)?.first as? ContactDetailTableViewCell else {
            XCTFail("Not there")
            return
        }
        
        cell.configureCell(with: contact)
        
        guard let emailLabel = cell.viewWithTag(1) as? UILabel,
            let phoneLabel = cell.viewWithTag(2) as? UILabel,
            let genderLabel = cell.viewWithTag(3) as? UILabel,
            let addressLabel = cell.viewWithTag(4) as? UILabel,
            let cityLabel = cell.viewWithTag(5) as? UILabel else {
                XCTFail("Tags Not Found")
                return
        }
        
        XCTAssertEqual(emailLabel.text, contact.email)
        XCTAssertEqual(phoneLabel.text, contact.phone)
        XCTAssertEqual(genderLabel.text, contact.gender)
        XCTAssertEqual(addressLabel.text, contact.address)
        XCTAssertEqual(cityLabel.text, contact.city)
    }
    
}
