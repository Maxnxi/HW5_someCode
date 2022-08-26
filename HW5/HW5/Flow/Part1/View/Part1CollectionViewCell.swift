//
//  Part1CollectionViewCell.swift
//  HW5
//
//  Created by Ponomarev Maksim on 25.08.2022.
//

import UIKit

class Part1CollectionViewCell: UICollectionViewCell {
    
    static let reusableCellIdentifier = "Part1CollectionViewCell"
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func configureUI(id: Int, name: String, email: String) {
        idLabel.text = id.description
        nameLabel.text = name
        emailLabel.text = email
        backView.layer.cornerRadius = 15
    }
}
