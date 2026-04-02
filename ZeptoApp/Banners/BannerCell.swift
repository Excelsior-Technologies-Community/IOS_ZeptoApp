//
//  BannerCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 26/03/26.
//

import UIKit

class BannerCell: UICollectionViewCell {

    @IBOutlet weak var bannerImageView: UIImageView!

    func configure(image: String) {
        bannerImageView.image = UIImage(named: image)
    }
}
