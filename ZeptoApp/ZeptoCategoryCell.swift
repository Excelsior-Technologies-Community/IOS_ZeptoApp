//
//  ZeptoCategoryCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 27/03/26.
//

import UIKit

class ZeptoCategoryCell: UICollectionViewCell{
  
    let items: [CategoryItem] = [
        CategoryItem(title: "Milk", imageName: "milk"),
        CategoryItem(title: "Fruits", imageName: "banana"),
        CategoryItem(title: "Vegies", imageName: "vegs"),
        CategoryItem(title: "Snacks", imageName: "snack"),
        CategoryItem(title: "Drinks", imageName: "drinks"),
        CategoryItem(title: "Bakery", imageName: "buns")
    ]
    @IBOutlet weak var buttonuiview: UIView!
    @IBOutlet weak var singleView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        singleView.layer.cornerRadius = 10
        buttonuiview.layer.cornerRadius = 15
        collectionView.register(
            UINib(nibName: "CategoryGridItemCell", bundle: nil),
            forCellWithReuseIdentifier: "CategoryGridItemCell"
        )
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout
                          as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
        }
        collectionView.isScrollEnabled = false
    }

}
extension ZeptoCategoryCell: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let spacing: CGFloat = 10
        let totalSpacing = spacing * 2

        let width = (collectionView.frame.width - totalSpacing) / 3

        return CGSize(width: width, height: 95)
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryGridItemCell",
            for: indexPath
        ) as! CategoryGridItemCell

        let item = items[indexPath.item]

        cell.configure(with: item)
        cell.titleLabel.text = item.title
        cell.productImageView.image = UIImage(named: item.imageName)

        return cell
    }
    
}
