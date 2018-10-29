//
//  ContactsCoordinator.swift
//  Contacts
//
//  Created by Noah Malmed on 10/25/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit

class ContactsCoordinator {
    
    private let navigationController: UINavigationController?
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Api
    public func display(page: ContactsPageEnum, animated: Bool = false) {
        switch(page) {
        case .list(let contacts):
            let contactsTableViewController = ContactsTableViewController()
            contactsTableViewController.contacts = contacts
            contactsTableViewController.delegate = self
            navigationController?.pushViewController(contactsTableViewController, animated: animated)
        case .detail(let contact):
            let detailViewController = DetailTableViewController()
            detailViewController.contact = contact
            navigationController?.pushViewController(detailViewController, animated: animated)
        }
    }
    
}

extension ContactsCoordinator: ContactsTableViewControllerDelegate {
    func contactsTableViewController(_ controller: ContactsTableViewController, didSelectCellWith contact: Contact) {
        display(page: .detail(contact: contact))
    }
}
