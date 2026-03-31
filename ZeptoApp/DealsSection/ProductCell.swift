//
//
//  ProductCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 31/03/26.
//

import UIKit

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var offPrice: UILabel!
    @IBOutlet weak var CuttedPrice: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var ProducstImage: UIImageView!
    @IBOutlet weak var Qua: UILabel!
    @IBOutlet weak var BrandName: UILabel!
    @IBOutlet weak var priceUI: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        // MARK: - Content View Styling
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        
        // MARK: - Shadow (apply on cell, not contentView)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 6
        layer.shadowOffset = CGSize(width: 0, height: 2)
        priceUI.layer.cornerRadius = 10
        // MARK: - Labels
        nameLabel.font = .systemFont(ofSize: 13, weight: .medium)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 2
        
        priceLabel.font = .boldSystemFont(ofSize: 14)
//        priceLabel.textColor = .systemGreen
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Reset values (important for reuse)
        nameLabel.text = nil
        priceLabel.text = nil
    }

    func configure(product: DealsProduct) {
        
        nameLabel.text = product.name
        priceLabel.text = product.price
        ProducstImage.image = UIImage(named: product.image)
        offPrice.text = product.offPrice
        BrandName.text = product.brandName
        Qua.text = product.quantity
        
        let attr = NSMutableAttributedString(string: product.cuttedPrice)
        attr.addAttribute(.strikethroughStyle,
                          value: 2,
                          range: NSRange(location: 0, length: attr.length))
        CuttedPrice.attributedText = attr
    }
}
