//
//  LeftMenuCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 31/03/26.
//

import UIKit
import UIKit
import UIKit

class LeftMenuCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionIndicator: UIView!
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
    }
    func configure(title: String, isSelected: Bool) {
        
        titleLabel.text = title
        
        // Indicator animation
        UIView.animate(withDuration: 0.2) {
            self.selectionIndicator.alpha = isSelected ? 1 : 0
        }
        
        if isSelected {
            containerView.backgroundColor = UIColor(hex: "#E6F4EA") 
            titleLabel.textColor = UIColor(hex: "#2E7D32")
        } else {
            containerView.backgroundColor = .white
            titleLabel.textColor = .black
        }
    }
    // MARK: - Reuse Fix
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        containerView.backgroundColor = .white
        titleLabel.textColor = .darkGray
    }
}
