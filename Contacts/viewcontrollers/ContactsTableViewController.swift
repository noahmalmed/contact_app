//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Noah Malmed on 10/25/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts: [Contact]?
    weak var delegate: ContactsTableViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView?.register(UINib(nibName: "MasterTableViewCell", bundle: nil), forCellReuseIdentifier: "master")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contacts = self.contacts else {
            return 0
        }
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "master", for: indexPath) as? MasterTableViewCell else {
            return UITableViewCell()
        }
        
        if let contact = self.contacts?[indexPath.row] {
            cell.configureCell(with: contact)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let contact = self.contacts?[indexPath.row] else {
            return
        }
        
        self.delegate?.contactsTableViewController(self, didSelectCellWith: contact)
    }
    
}

protocol ContactsTableViewControllerDelegate: class {
    func contactsTableViewController(_ controller: ContactsTableViewController, didSelectCellWith contact: Contact)
}
