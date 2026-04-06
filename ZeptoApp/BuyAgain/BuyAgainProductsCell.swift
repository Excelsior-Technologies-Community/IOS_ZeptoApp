//
//  BuyAgainProductsCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 01/04/26.
//

import UIKit
struct TopCategory {
    let title: String
    let normalImage: String
    let selectedImage: String
}
enum CategoryType: Int, CaseIterable {
    case all, cafe, fruits, dairy, snacks, drinks
    
    var title: String {
        switch self {
        case .all: return "All Items"
        case .cafe: return "Zepto Cafe"
        case .fruits: return "Fruits & Vegetables"
        case .dairy: return "Dairy Products"
        case .snacks: return "Snacks & Drinks"
        case .drinks: return "Drinks"
        }
    }
    
    var image: String {
        switch self {
        case .all: return "All"
        case .cafe: return "Zeptocafe"
        case .fruits: return "Fruitesproducst"
        case .dairy: return "Dairyproduct"
        case .snacks: return "SnacksPro"
        case .drinks: return "Bunsproducts"
        }
    }
}
class BuyAgainProductsCell: UICollectionViewCell {

    let categories: [TopCategory] = [
        TopCategory(title: "All Items", normalImage: "All", selectedImage: "AllSelected"),
        TopCategory(title: "Zepto Cafe", normalImage: "Zeptocafe", selectedImage: "ZeptocafeSeelcted"),
        TopCategory(title: "Fruits & Veggies", normalImage: "Fruitesproducst", selectedImage: "FruitesproducstSelectedpng"),
        TopCategory(title: "Dairy", normalImage: "Dairyproduct", selectedImage: "DairySelected"),
        TopCategory(title: "Snacks", normalImage: "SnacksPro", selectedImage: "SnacksProSelected"),
        TopCategory(title: "Drinks", normalImage: "Bunsproducts", selectedImage: "BunsSeelcted")
    ]
    var selectedIndex = 0
    var selectedCategoryIndex = 0
    var products: [CategoryType: [DealsProduct]] = [:]
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        setupData()
        topCollectionView.register(UINib(nibName: "TopButtonsCell", bundle: nil), forCellWithReuseIdentifier: "TopButtonsCell")
        
        productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        
        
    }
    func setupData() {
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
    }
}

extension BuyAgainProductsCell: UICollectionViewDataSource,
                                 UICollectionViewDelegate,
                                 UICollectionViewDelegateFlowLayout {
    
    // MARK: - Count
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == topCollectionView {
            return categories.count   
        } else {
            let category = CategoryType.allCases[selectedCategoryIndex]
            return products[category]?.count ?? 0
        }
    }
    
    // MARK: - Cell
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 🔝 TOP CATEGORY
        if collectionView == topCollectionView {
            
            guard indexPath.item < categories.count else {
                return UICollectionViewCell()
            }
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TopButtonsCell",
                for: indexPath
            ) as! TopButtonsCell
            
            let category = categories[indexPath.item]
            
            cell.configure(
                category: category,
                isSelected: indexPath.item == selectedIndex
            )
            
            return cell
        }
        
        // 🛒 PRODUCTS
        else {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ProductCell",
                for: indexPath
            ) as! ProductCell
            
            let category = CategoryType.allCases[selectedCategoryIndex]
            
            if let product = products[category]?[indexPath.item] {
                cell.configure(product: product)
            }
            
            return cell
        }
    }
    
    // MARK: - Selection
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == topCollectionView {
            
            selectedIndex = indexPath.item
            selectedCategoryIndex = indexPath.item   // 🔥 MAIN FIX
            
            // Reload both
            topCollectionView.reloadData()
            productCollectionView.reloadData()
            
            // 🔥 Smooth UX
            topCollectionView.scrollToItem(
                at: indexPath,
                at: .centeredHorizontally,
                animated: true
            )
            
            productCollectionView.setContentOffset(.zero, animated: true)
        }
    }
    
    // MARK: - Size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == topCollectionView {
            
            let width = collectionView.frame.width / 5
            return CGSize(width: width, height: 100)
        }
        
        // Product Grid
        let width = (collectionView.frame.width / 2) - 12
        return CGSize(width: width, height: 228)
    }
    
    // MARK: - Spacing
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
