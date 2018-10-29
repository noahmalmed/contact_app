//
//  MasterTableViewCell.swift
//  Contacts
//
//  Created by Noah Malmed on 10/25/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var jobTitleLabel: UILabel!
    @IBOutlet private weak var departmentLabel: UILabel!
    
    public func configureCell(with contact: Contact) {
        self.nameLabel.text = contact.fullName
        self.jobTitleLabel.text = contact.jobTitle
        self.departmentLabel.text = contact.department
    }
    
}
