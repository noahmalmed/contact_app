//
//  ContactDetailTableViewCell.swift
//  Contacts
//
//  Created by Noah Malmed on 10/28/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit

class ContactDetailTableViewCell: UITableViewCell, ContactConfigurableCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var genderTitle: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configureCell(with contact: Contact) {
        emailLabel.text = contact.email
        phoneLabel.text = contact.phone
        addressLabel.text = contact.address
        
        if let gender = contact.gender {
            genderLabel.text = gender
        } else {
            genderLabel.isHidden = true
            genderTitle.isHidden = true
        }
        
        if let city = contact.city {
            cityLabel.text = city
        }
    }
    
}
