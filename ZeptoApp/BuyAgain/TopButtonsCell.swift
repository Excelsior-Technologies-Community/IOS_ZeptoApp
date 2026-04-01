//
//  TopButtonsCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 01/04/26.
//

import UIKit

class TopButtonsCell: UICollectionViewCell {

    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        containerView.layer.cornerRadius = 10
    }
    
    func configure(title: String, imageName: String, isSelected: Bool) {
        
        titleLabel.text = title
        iconImage.image = UIImage(named: imageName)
        
        if isSelected {
            titleLabel.textColor = UIColor(hex: "#F8105E")
            indicatorView.backgroundColor = UIColor(hex: "#F8105E")
            indicatorView.isHidden = false
            
            containerView.backgroundColor = UIColor(hex: "#FFEAF1") 
        } else {
            titleLabel.textColor = .black
            indicatorView.isHidden = true
            
            containerView.backgroundColor = .clear
        }
    }
}
