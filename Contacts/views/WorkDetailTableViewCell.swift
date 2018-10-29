//
//  WorkDetailTableViewCell.swift
//  Contacts
//
//  Created by Noah Malmed on 10/28/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit

class WorkDetailTableViewCell: UITableViewCell, ContactConfigurableCell {

    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    public func configureCell(with contact: Contact) {
        departmentLabel.text = contact.department
        titleLabel.text = contact.jobTitle
    }
}
