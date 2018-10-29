//
//  DetailTitleTableViewCell.swift
//  Contacts
//
//  Created by Noah Malmed on 10/28/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell, ContactConfigurableCell {
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configureCell(with contact: Contact) {
        nameLabel.text = contact.fullName
        
        if let cityName = contact.city {
            cityLabel.text = cityName
        } else {
            cityLabel.isHidden = true
        }
        
        let contactImage: UIImage?
        if let gender = contact.gender {
            if (gender == "male") {
                contactImage = UIImage(named: "default_male.png")
            } else {
                contactImage = UIImage(named: "default_female.png")
            }
        } else {
            contactImage = UIImage(named: "default_male.png")
        }
        contactImageView.image = contactImage
    }
    
}
