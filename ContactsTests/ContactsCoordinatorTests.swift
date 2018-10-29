//
//  ContactsCoordinatorTests.swift
//  ContactsTests
//
//  Created by Noah Malmed on 10/28/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import XCTest

class DummyNavigationController: UINavigationController {
    var expectedViewController: UIViewController?
    var expectedContact: Contact?
    var expectedContactList: [Contact]?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        XCTAssertTrue((expectedViewController?.isKind(of: type(of: viewController)))!)
        
        if let contactViewController = viewController as? ContactsTableViewController {
            XCTAssertTrue(contactViewController.contacts![0] == expectedContactList![0])
        }
        
        if let detailsViewController = viewController as? DetailTableViewController {
            XCTAssertTrue(detailsViewController.contact! == expectedContact!)
        }
    }
}

class ContactsCoordinatorTests: XCTestCase {
    
    let contact = Contact(id: 1, firstName: "n", lastName: "m", email: "e", gender: "male", phone: "ring", department: "d", jobTitle: "jt", address: "a", city: "c")
    
    func testPushMasterViewController() {
        let navController = DummyNavigationController()
        navController.expectedViewController = ContactsTableViewController()
        navController.expectedContactList = [contact]
        let coordinator = ContactsCoordinator(navigationController: navController)
        coordinator.display(page: .list(contacts: [contact]))
    }
    
    func testPushDetailViewController() {
        let navController = DummyNavigationController()
        navController.expectedViewController = DetailTableViewController()
        navController.expectedContact = self.contact
        let coordinator = ContactsCoordinator(navigationController: navController)
        coordinator.display(page: .detail(contact: self.contact))
    }
    
}
