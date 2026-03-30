//
//  OfferItemCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 30/03/26.
//

import UIKit

class OfferItemCell: UICollectionViewCell {

    @IBOutlet weak var rightUIView: UIView!
    @IBOutlet weak var leftUIView: UIView!
    @IBOutlet weak var inneruiview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        rightUIView.layer.cornerRadius = 15
        
        leftUIView.layer.cornerRadius = 15
        inneruiview.layer.cornerRadius = 15

    }

}
