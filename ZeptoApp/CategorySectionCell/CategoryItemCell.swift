//
//  CategoryItemCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 30/03/26.
//

import UIKit


class CategoryItemCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    func configure(item: CategoryItem) {
        titleLabel.text = item.title
        iconImageView.image = UIImage(named: item.imageName)
    }
}
