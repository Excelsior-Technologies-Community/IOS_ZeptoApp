//
//  SeeMoreCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 26/03/26.
//

import UIKit

class SeeMoreCell: UICollectionViewCell {

    @IBOutlet weak var seemoreUI: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        seemoreUI.layer.cornerRadius = 15
    }

}
