//
//  HomeTopSectionCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 24/03/26.
//

import UIKit

class HomeTopSectionCell: UICollectionViewCell {

    @IBOutlet weak var searchui: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        searchui.layer.borderColor = UIColor.black.cgColor
        
        searchui.layer.cornerRadius = 15
        searchui.layer.borderWidth = 0.9
    }

}
