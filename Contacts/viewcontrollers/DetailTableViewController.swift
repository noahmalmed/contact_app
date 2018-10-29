//
//  DetailTableViewController.swift
//  Contacts
//
//  Created by Noah Malmed on 10/25/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.separatorColor = UIColor.clear;

        
        self.tableView?.register(UINib(nibName: "DetailTitleTableViewCell", bundle: nil), forCellReuseIdentifier: DetailTableViewCellType.title.identifier())
        self.tableView?.register(UINib(nibName: "WorkDetailTableViewCell", bundle: nil), forCellReuseIdentifier: DetailTableViewCellType.work.identifier())
        self.tableView?.register(UINib(nibName: "ContactDetailTableViewCell", bundle: nil), forCellReuseIdentifier: DetailTableViewCellType.contact.identifier())
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = DetailTableViewCellType(rawValue: indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier(), for: indexPath) as? ContactConfigurableCell else {
            return UITableViewCell()
        }
        
        if let contact = self.contact {
            cell.configureCell(with: contact)
        }
        
        return cell as! UITableViewCell
    }

}

protocol ContactConfigurableCell {
    func configureCell(with contact: Contact)
}

private enum DetailTableViewCellType: Int {
    case title = 0
    case work = 1
    case contact = 2
    
    func identifier() -> String {
        switch (self) {
        case .title: return "title"
        case .work: return "work"
        case .contact: return "contact"
        }

    }
}
