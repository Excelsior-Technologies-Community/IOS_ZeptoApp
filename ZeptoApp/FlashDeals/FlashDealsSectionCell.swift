//
//  FlashDealsSectionCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 02/04/26.
//

import UIKit

class FlashDealsSectionCell: UICollectionViewCell {

    
     var selectedCategoryIndex = 0
    var products: [CategoryType: [DealsProduct]] = [:]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seeAllButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
            
            collectionView.register(UINib(nibName: "ProductCell", bundle: nil),
                                    forCellWithReuseIdentifier: "ProductCell")
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            collectionView.decelerationRate = .fast
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            
            // ✅ DO NOT set itemSize here — do it in sizeForItemAt
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 0
            }
            
           
        
        products = [
            
            // 🔥 ALL (mix of everything)
            .all: [
                DealsProduct(name: "Fresh Milk", price: "₹40", cuttedPrice: "₹50", offPrice: "₹10 OFF", brandName: "Amul", quantity: "500ml", image: "milk"),
                DealsProduct(name: "Banana", price: "₹30", cuttedPrice: "₹45", offPrice: "₹15 OFF", brandName: "Fresh", quantity: "1 dozen", image: "banana"),
                DealsProduct(name: "Mix Masala", price: "₹19", cuttedPrice: "₹40", offPrice: "₹21 OFF", brandName: "Dabur", quantity: "50g", image: "MixMasala"),
                DealsProduct(name: "Hazelnut Chocolate", price: "₹9", cuttedPrice: "₹20", offPrice: "₹11 OFF", brandName: "Eat Better", quantity: "20g", image: "HazelnutChocolate"),
                DealsProduct(name: "Fresh Bread", price: "₹25", cuttedPrice: "₹35", offPrice: "₹10 OFF", brandName: "Bakery", quantity: "1 pack", image: "buns"),
                DealsProduct(name: "Cold Coffee", price: "₹95", cuttedPrice: "₹120", offPrice: "₹25 OFF", brandName: "Cafe", quantity: "300ml", image: "cafe")
            ],
            
            // ☕ CAFE
            .cafe: [
                DealsProduct(name: "Cold Coffee", price: "₹95", cuttedPrice: "₹120", offPrice: "₹25 OFF", brandName: "Cafe", quantity: "300ml", image: "cafe"),
                DealsProduct(name: "Cafe Combo", price: "₹150", cuttedPrice: "₹200", offPrice: "₹50 OFF", brandName: "Cafe", quantity: "1 combo", image: "cafe_selected")
            ],
            
            // 🍎 FRUITS
            .fruits: [
                DealsProduct(name: "Banana", price: "₹30", cuttedPrice: "₹45", offPrice: "₹15 OFF", brandName: "Fresh", quantity: "1 dozen", image: "banana"),
                DealsProduct(name: "Mango", price: "₹60", cuttedPrice: "₹80", offPrice: "₹20 OFF", brandName: "Fresh", quantity: "1 kg", image: "mango"),
                DealsProduct(name: "Fresh Fruits Mix", price: "₹120", cuttedPrice: "₹150", offPrice: "₹30 OFF", brandName: "Fresh", quantity: "1 pack", image: "fruites")
            ],
            
            // 🥛 DAIRY
            .dairy: [
                DealsProduct(name: "Amul Milk", price: "₹40", cuttedPrice: "₹50", offPrice: "₹10 OFF", brandName: "Amul", quantity: "500ml", image: "milk"),
                DealsProduct(name: "Butter", price: "₹55", cuttedPrice: "₹70", offPrice: "₹15 OFF", brandName: "Amul", quantity: "100g", image: "dairy"),
                DealsProduct(name: "Fresh Dairy Pack", price: "₹90", cuttedPrice: "₹120", offPrice: "₹30 OFF", brandName: "Amul", quantity: "combo", image: "fresh")
            ],
            
            // 🍟 SNACKS
            .snacks: [
                DealsProduct(name: "Snack Pack", price: "₹20", cuttedPrice: "₹30", offPrice: "₹10 OFF", brandName: "Lays", quantity: "1 pack", image: "buns"),
                DealsProduct(name: "Masala Mix", price: "₹19", cuttedPrice: "₹40", offPrice: "₹21 OFF", brandName: "Dabur", quantity: "50g", image: "masala"),
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "30g", image: "SeedMix")
            ],
            
            // 🥤 DRINKS
            .drinks: [
                DealsProduct(name: "Cold Drink", price: "₹40", cuttedPrice: "₹60", offPrice: "₹20 OFF", brandName: "Coca-Cola", quantity: "300ml", image: "drinks"),
                DealsProduct(name: "Fresh Juice", price: "₹70", cuttedPrice: "₹100", offPrice: "₹30 OFF", brandName: "Real", quantity: "500ml", image: "fresh_selected")
            ]
        ]
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // Forces collectionView to use the actual cell width
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension FlashDealsSectionCell: UICollectionViewDataSource,
                                 UICollectionViewDelegate,
                                 UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        let category = CategoryType.allCases[selectedCategoryIndex]
        return products[category]?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProductCell",
            for: indexPath
        ) as? ProductCell else {
            return UICollectionViewCell() // safety fallback
        }

        let category = CategoryType.allCases[selectedCategoryIndex]

        if let product = products[category]?[indexPath.item] {
            cell.configure(product: product)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 140, height: 200)  // ✅ correct
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }
}
