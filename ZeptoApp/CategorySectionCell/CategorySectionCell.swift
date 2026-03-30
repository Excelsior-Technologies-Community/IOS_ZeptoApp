//
//  CategorySectionCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 30/03/26.
//

import UIKit
 
class CategorySectionCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    let sections: [(title: String, items: [CategoryItem])] = [

        ("Beauty & Personal Care", [
          
            CategoryItem(title: "Personal Care", imageName: "Personal"),
                  CategoryItem(title: "Skincare", imageName: "skincare"),
                  CategoryItem(title: "Makeup & Beauty", imageName: "Makeup & Beauty"),
                  CategoryItem(title: "Fragrance", imageName: "Fragrance"),
                  CategoryItem(title: "Bath & Body", imageName: "Bath & Body"),
                  CategoryItem(title: "Haircare", imageName: "Haircare"),
                  CategoryItem(title: "Baby Care", imageName: "Baby Care"),
                  CategoryItem(title: "Sexual Wellness", imageName: "Sexual Wellness")
        ]),

        ("Household Essentials", [
            CategoryItem(title: "Home Needs", imageName: "home1"),
            CategoryItem(title: "Kitchen & Dining", imageName: "home2"),
            CategoryItem(title: "Cleaning Essentials", imageName: "home3"),
            CategoryItem(title: "Electronics", imageName: "home4"),
            CategoryItem(title: "Pet Care", imageName: "home5"),
            CategoryItem(title: "Toys & Sports", imageName: "home6"),
            CategoryItem(title: "Stationery", imageName: "home7"),
            CategoryItem(title: "Paan Corner", imageName: "home8")
        ]),

        ("Shop by Store", [
            CategoryItem(title: "Summer Store", imageName: "store1"),
            CategoryItem(title: "Gift Store", imageName: "store2"),
            CategoryItem(title: "Ayush Store", imageName: "store3"),
            CategoryItem(title: "Pooja Store", imageName: "store4"),
            CategoryItem(title: "Wedding Store", imageName: "store5"),
            CategoryItem(title: "Global Store", imageName: "store6"),
            CategoryItem(title: "Sports Store", imageName: "store7"),
            CategoryItem(title: "Decor Store", imageName: "store8")
        ])
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        collectionView.isScrollEnabled = false
        
    }

    private func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 20, right: 16)

        collectionView.collectionViewLayout = layout

        collectionView.register(UINib(nibName: "CategoryItemCell", bundle: nil),
                                forCellWithReuseIdentifier: "CategoryItemCell")

        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeaderView"
        )
    }
}
extension CategorySectionCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "HeaderView",
            for: indexPath
        )

        header.subviews.forEach { $0.removeFromSuperview() }

        let label = UILabel()
        label.text = sections[indexPath.section].0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 16, y: 0, width: 300, height: 40)

        header.addSubview(label)

        return header
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 40)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryItemCell",
            for: indexPath
        ) as! CategoryItemCell

        let item = sections[indexPath.section].items[indexPath.row]
        cell.configure(item: item)

        return cell
    }
}
extension CategorySectionCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - 48) / 4
        return CGSize(width: width, height: width + 25)
    }
}
