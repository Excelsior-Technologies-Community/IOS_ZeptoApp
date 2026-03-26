//
//  ProductItemCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 26/03/26.
//

import UIKit

class ProductItemCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cutPriceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!

    @IBOutlet weak var mainview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with product: Product) {

        productImageView.image = UIImage(named: product.imageName)

        mainview.layer.cornerRadius = 15
        titleLabel.text = product.name
        weightLabel.text = product.weight
        priceLabel.text = product.price

        // Strike price
        let attributed = NSAttributedString(
            string: product.cutPrice,
            attributes: [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.lightGray
            ]
        )
        cutPriceLabel.attributedText = attributed

        // Discount
        if let discount = product.discount {
            discountLabel.text = discount
            discountLabel.isHidden = false
        } else {
            discountLabel.isHidden = true
        }

        // Button style
        addButton.layer.cornerRadius = 8
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor(hex: "#F80E5D").cgColor
        addButton.setTitleColor(.systemGreen, for: .normal)
    }
}
