//
//  LeftMenuCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 31/03/26.
//

import UIKit

class LeftMenuCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 12
    }

    func configure(title: String, isSelected: Bool) {
        titleLabel.text = title
        
        if isSelected {
            containerView.backgroundColor = .systemGreen
            titleLabel.textColor = .white
        } else {
            containerView.backgroundColor = .systemGray5
            titleLabel.textColor = .black
        }
    }
}
