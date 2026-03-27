//
//  ZeptoProductsTopPartCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 26/03/26.
//

import UIKit

class ZeptoProductsTopPartCell: UICollectionViewCell {

    let products: [Product] = [
        Product(name: "Banana",
                weight: "1 dozen",
                price: "₹81",
                cutPrice: "₹100",
                imageName: "banana",
                discount: "19% OFF"),

        Product(name: "Banana",
                weight: "1 dozen",
                price: "₹81",
                cutPrice: "₹100",
                imageName: "banana",
                discount: "19% OFF"),

        Product(name: "Banana",
                weight: "1 dozen",
                price: "₹81",
                cutPrice: "₹100",
                imageName: "banana",
                discount: "19% OFF"),

        Product(name: "Milk",
                weight: "500 ml",
                price: "₹31",
                cutPrice: "₹35",
                imageName: "milk",
                discount: "10% OFF")
    ]
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.backgroundColor = .clear

        collectionView.register(
            UINib(nibName: "HorizontalProductsCell", bundle: nil),
            forCellWithReuseIdentifier: "HorizontalProductsCell"
        )

        collectionView.register(
            UINib(nibName: "SeeMoreCell", bundle: nil),
            forCellWithReuseIdentifier: "SeeMoreCell"
        )

        collectionView.register(
            UINib(nibName: "ZeptoCategoryCell", bundle: nil),
            forCellWithReuseIdentifier: "ZeptoCategoryCell"
        )

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 12
        }
    }
}
extension ZeptoProductsTopPartCell: UICollectionViewDelegate,
                                     UICollectionViewDataSource,
                                     UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.item == 0 {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "HorizontalProductsCell",
                for: indexPath
            )
        }

        if indexPath.item == 1 {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "SeeMoreCell",
                for: indexPath
            )
        }
        return collectionView.dequeueReusableCell(
            withReuseIdentifier: "ZeptoCategoryCell",
            for: indexPath
        )
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width

        if indexPath.item == 0 {
            return CGSize(width: width, height: 260) // horizontal products
        }

        if indexPath.item == 1 {
            return CGSize(width: width, height: 50) // see more
        }
        
        
        return CGSize(width: width, height: 230)
     
    }
}
