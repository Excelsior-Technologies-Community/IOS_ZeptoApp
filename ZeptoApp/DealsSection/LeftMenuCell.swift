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
    
    // MARK: - Configure
    func configure(title: String, isSelected: Bool, index: Int) {
        
        // 👉 FIRST CELL (SPECIAL TEXT)
        if index == 0 {
            titleLabel.text = "BEST \nDEALS"
        } else {
            titleLabel.text = "\n\(title)"
        }
        
        // 👉 SELECTION UI
        if isSelected {
            containerView.backgroundColor = UIColor(hex: "#E4F9EB") // your green
            titleLabel.textColor = .black
        } else {
            containerView.backgroundColor = .white
            titleLabel.textColor = .darkGray
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
