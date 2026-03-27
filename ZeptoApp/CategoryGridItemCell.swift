//
//  CategoryGridItemCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 27/03/26.
//

import UIKit

struct CategoryItem {
    let title: String
    let imageName: String
}

class CategoryGridItemCell: UICollectionViewCell {

  
    @IBOutlet weak var mianview: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mianview.layer.cornerRadius = 15
    }
    func configure(with item: CategoryItem) {
        titleLabel.text = item.title
        productImageView.image = UIImage(named: item.imageName)
    }
}
