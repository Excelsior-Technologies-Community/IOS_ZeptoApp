//
//  TopCouponCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 30/03/26.
//

import UIKit

class TopCouponCell: UICollectionViewCell {

    @IBOutlet weak var threeui: UIView!
    @IBOutlet weak var oneUI: UIView!
    @IBOutlet weak var fourui: UIView!
    @IBOutlet weak var twiui: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        oneUI.layer.cornerRadius = 15
        twiui.layer.cornerRadius = 15
        threeui.layer.cornerRadius = 15
        fourui.layer.cornerRadius = 15
    }

}
