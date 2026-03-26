//
//  HorizontalProductsCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 26/03/26.
//

import UIKit

class HorizontalProductsCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    let products: [Product] = [
        Product(name: "banana", weight: "1 dozen", price: "₹81", cutPrice: "₹100", imageName: "banana", discount: "19% OFF"),
        Product(name: "milk", weight: "500 ml", price: "₹31", cutPrice: "₹35", imageName: "milk", discount: "10% OFF"),
        Product(name: "apple", weight: "1 kg", price: "₹120", cutPrice: "₹150", imageName: "apple", discount: "20% OFF"),
        Product(name: "mango", weight: "1 kg", price: "₹120", cutPrice: "₹150", imageName: "apple", discount: "20% OFF")
    ]
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.backgroundColor = .clear

        collectionView.register(
            UINib(nibName: "ProductItemCell", bundle: nil),
            forCellWithReuseIdentifier: "ProductItemCell"
        )

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 12
        }
    }
}
extension HorizontalProductsCell: UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProductItemCell",
            for: indexPath
        ) as! ProductItemCell

        let product = products[indexPath.item]
        cell.configure(with: product)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 160, height: 220)
    }
}
