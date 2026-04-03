//
//  TopButtonsCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 01/04/26.
//

import UIKit
 
class TopButtonsCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Label setup
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        
        // UI styling
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        
        indicatorView.layer.cornerRadius = 2
    }
    
    // MARK: - Configure
    func configure(category: TopCategory, isSelected: Bool) {
        
        titleLabel.text = category.title
        
        // Image handling
        iconImage.image = UIImage(
            named: isSelected ? category.selectedImage : category.normalImage
        )
        
        if isSelected {
            titleLabel.textColor = UIColor(hex: "#F8105E")
            indicatorView.backgroundColor = UIColor(hex: "#F8105E")
            indicatorView.isHidden = false
            containerView.backgroundColor = UIColor(hex: "#FFEAF1")
            
            // Optional animation 🔥
            self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            
        } else {
            titleLabel.textColor = .black
            indicatorView.isHidden = true
            containerView.backgroundColor = .clear
            self.transform = .identity
        }
    }
}
