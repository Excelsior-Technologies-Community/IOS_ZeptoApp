//
//  DealsSectionView.swift
//  ZeptoApp
//
//  Created by Noman belim on 31/03/26.
//

import UIKit
enum DealType: Int, CaseIterable {
    case best
    case nine
    
    case nineteen
    
    var title: String {
        switch self {
        case .best: return "₹9"
        case .nine: return "₹19"
        case .nineteen: return "₹19"
        }
    }
}
struct DealsProduct {
    let name: String
    let price: String
    let cuttedPrice: String
    let offPrice: String
    let brandName: String
    let quantity: String
    let image: String
}
class DealsSectionView: UICollectionViewCell {
    var selectedIndex: Int = 0
        
        var products: [DealType: [DealsProduct]] = [:]
    @IBOutlet weak var leftCollectionView: UICollectionView!
    @IBOutlet weak var rightCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        leftCollectionView.showsVerticalScrollIndicator = false
        leftCollectionView.showsHorizontalScrollIndicator = false
        rightCollectionView.showsVerticalScrollIndicator = false
        rightCollectionView.showsHorizontalScrollIndicator = false
        leftCollectionView.delegate = self
        leftCollectionView.dataSource = self
        
        rightCollectionView.delegate = self
        rightCollectionView.dataSource = self
        setupData()
        
        leftCollectionView.register(LeftMenuCell.self, forCellWithReuseIdentifier: "LeftMenuCell")
        
        leftCollectionView.register(UINib(nibName: "LeftMenuCell", bundle: nil),  forCellWithReuseIdentifier: "LeftMenuCell")
        rightCollectionView.register(UINib(nibName: "ProductCell", bundle: nil),  forCellWithReuseIdentifier: "ProductCell")
    }
    
    func setupData() {
        products = [
            .best: [
                DealsProduct(name: "Hazelnut Chocolate", price: "₹9", cuttedPrice: "₹20", offPrice: "₹11 OFF", brandName: "Eat Better Co", quantity: "1 pack (20g)", image: "HazelnutChocolate"),
                DealsProduct(name: "Mix Masala", price: "₹19", cuttedPrice: "₹40", offPrice: "₹21 OFF", brandName: "Dabur", quantity: "1 pack (50g)", image: "MixMasala"),
                
                DealsProduct(name: "Hazelnut Chocolate", price: "₹9", cuttedPrice: "₹20", offPrice: "₹11 OFF", brandName: "Eat Better Co", quantity: "1 pack (20g)", image: "HazelnutChocolate"),
                DealsProduct(name: "Mix Masala", price: "₹19", cuttedPrice: "₹40", offPrice: "₹21 OFF", brandName: "Dabur", quantity: "1 pack (50g)", image: "MixMasala"),
                
                DealsProduct(name: "Hazelnut Chocolate", price: "₹9", cuttedPrice: "₹20", offPrice: "₹11 OFF", brandName: "Eat Better Co", quantity: "1 pack (20g)", image: "HazelnutChocolate"),
                DealsProduct(name: "Mix Masala", price: "₹19", cuttedPrice: "₹40", offPrice: "₹21 OFF", brandName: "Dabur", quantity: "1 pack (50g)", image: "MixMasala"),
                
                DealsProduct(name: "Hazelnut Chocolate", price: "₹9", cuttedPrice: "₹20", offPrice: "₹11 OFF", brandName: "Eat Better Co", quantity: "1 pack (20g)", image: "HazelnutChocolate"),
                DealsProduct(name: "Mix Masala", price: "₹19", cuttedPrice: "₹40", offPrice: "₹21 OFF", brandName: "Dabur", quantity: "1 pack (50g)", image: "MixMasala"),
                
                DealsProduct(name: "Hazelnut Chocolate", price: "₹9", cuttedPrice: "₹20", offPrice: "₹11 OFF", brandName: "Eat Better Co", quantity: "1 pack (20g)", image: "HazelnutChocolate"),
                DealsProduct(name: "Mix Masala", price: "₹19", cuttedPrice: "₹40", offPrice: "₹21 OFF", brandName: "Dabur", quantity: "1 pack (50g)", image: "MixMasala")
            ],
            
            .nine: [
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack"),
                DealsProduct(name: "Snack Pack", price: "₹9", cuttedPrice: "₹25", offPrice: "₹16 OFF", brandName: "Amul", quantity: "1 pack (10g)", image: "SnackPack")
            ],
            
            .nineteen: [
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix"),
                DealsProduct(name: "Seed Mix", price: "₹19", cuttedPrice: "₹35", offPrice: "₹16 OFF", brandName: "Yoga Bar", quantity: "1 pack (30g)", image: "SeedMix")
            ]
        ]
    }
}
extension DealsSectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == leftCollectionView {
            selectedIndex = indexPath.item
            
            leftCollectionView.reloadData()
            rightCollectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == leftCollectionView {
            return DealType.allCases.count
        } else {
            let deal = DealType.allCases[selectedIndex]
            return products[deal]?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == leftCollectionView {
            
            let totalItems = DealType.allCases.count
            
            // Remove spacing influence
            let spacing: CGFloat = 10
            
            let height = (collectionView.frame.height - (CGFloat(totalItems - 1) * spacing)) / CGFloat(totalItems)
            
            return CGSize(width: collectionView.frame.width, height: height - 7)
        }
        
        if collectionView == rightCollectionView {
            
            let totalItems = DealType.allCases.count
            let height = collectionView.frame.height / CGFloat(totalItems)
            
            return CGSize(width: collectionView.frame.width / 2, height: height - 15)
        }
        return CGSize(width: 120, height: 190)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == rightCollectionView {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        if collectionView == leftCollectionView {
            
            return UIEdgeInsets(top: 10, left: 10, bottom: -30, right: 10)
        }
        
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == leftCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeftMenuCell", for: indexPath) as! LeftMenuCell
            
            let deal = DealType.allCases[indexPath.item]
            
            cell.configure(
                title: deal.title,
                isSelected: indexPath.item == selectedIndex
            )
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            
            let deal = DealType.allCases[selectedIndex]
            if let product = products[deal]?[indexPath.item] {
                cell.configure(product: product)
            }
            
            return cell
        }
    }
}

