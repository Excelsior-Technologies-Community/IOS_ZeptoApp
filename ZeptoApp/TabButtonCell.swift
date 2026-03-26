//
//  TabButtonCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 25/03/26.
//

//
//  TabButtonCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 25/03/26.
//

import UIKit

class TabButtonCell: UICollectionViewCell {

    @IBOutlet weak var selectionLine: UIView!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lblview: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Clear all backgrounds
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        // Clear every subview background recursively
        clearBackgrounds(of: contentView)
    }
    
    private func clearBackgrounds(of view: UIView) {
        view.backgroundColor = .clear
        for subview in view.subviews {
            clearBackgrounds(of: subview)
        }
    }
    
    func configure(isSelected: Bool) {
        selectionLine.backgroundColor = .clear
        lblview.textColor = isSelected ? .green : .black   // change colors as needed
        selectionLine.isHidden = !isSelected
    }
}
