//
//  ViewController.swift
//  ZeptoApp
//
//  Created by Noman belim on 24/03/26.
//

import UIKit
 
struct BannerItem {
    let imageName: String
}
enum HomeType {
    case zepto
    case off
    case cafe
    case fresh
}
class ViewController: UIViewController {
    var contentStartIndex: Int {
        return isTabsHidden ? 1 : 2
    }
    var currentType : HomeType = .zepto
    var isTabsHidden = false
    var selectedIndex: Int = 0
    @IBOutlet weak var Collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        RegisterXibs()
        
    }

    func RegisterXibs(){
        Collectionview.delegate = self
        Collectionview.dataSource = self
        Collectionview.register(UINib(nibName: "ZeptoContentCell", bundle: nil),
                                forCellWithReuseIdentifier: "ZeptoContentCell")
     Collectionview.register(UINib(nibName: "FlashDealsSectionCell", bundle: nil),
                                forCellWithReuseIdentifier: "FlashDealsSectionCell")
        Collectionview.register(
            UINib(nibName: "SeeMoreCell", bundle: nil),
            forCellWithReuseIdentifier: "SeeMoreCell"
        )
        Collectionview.register(UINib(nibName: "OffContentCell", bundle: nil),forCellWithReuseIdentifier: "OffContentCell")
        Collectionview.register(UINib(nibName: "DealsSectionView", bundle: nil),forCellWithReuseIdentifier: "DealsSectionView")

        Collectionview.register(UINib(nibName: "CafeContentCell", bundle: nil),
                                forCellWithReuseIdentifier: "CafeContentCell")
        Collectionview.register(UINib(nibName: "CategorySectionCell", bundle: nil),
                                forCellWithReuseIdentifier: "CategorySectionCell")
        Collectionview.register(UINib(nibName: "FreshContentCell", bundle: nil),
                                forCellWithReuseIdentifier: "FreshContentCell")
        Collectionview.register(UINib(nibName: "ZeptoHeaderView", bundle: nil),  forCellWithReuseIdentifier: "ZeptoHeaderView")
        Collectionview.register(UINib(nibName: "HomeTopSectionCell", bundle: nil),  forCellWithReuseIdentifier: "HomeTopSectionCell")
        Collectionview.register(UINib(nibName: "HomeHeaderFullCell", bundle: nil),  forCellWithReuseIdentifier: "HomeHeaderFullCell")
        Collectionview.register(UINib(nibName: "TabsCell", bundle: nil),  forCellWithReuseIdentifier: "TabsCell")
        Collectionview.register(UINib(nibName: "CouponsOffersCell", bundle: nil),  forCellWithReuseIdentifier: "CouponsOffersCell")
        Collectionview.register(UINib(nibName: "BuyAgainProductsCell", bundle: nil),  forCellWithReuseIdentifier: "BuyAgainProductsCell")
        Collectionview.register(
            UINib(nibName: "HomeBannerSectionCell", bundle: nil),
            forCellWithReuseIdentifier: "HomeBannerSectionCell"
        )
    }
}
extension ViewController: UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        // Header + (Tabs optional) + Content + Coupons
        return isTabsHidden ? 7 : 8
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // 0 → Header
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "HomeHeaderFullCell",
                for: indexPath
            ) as! HomeHeaderFullCell

            cell.delegate = self
            return cell
        }

        // 1 → Tabs
        if !isTabsHidden && indexPath.item == 1 {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "TabsCell",
                for: indexPath
            )
        }

        let contentIndex = contentStartIndex

        // 2 → Main Content
        if indexPath.item == contentIndex {
            switch currentType {

            case .zepto:
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "ZeptoContentCell",
                    for: indexPath
                )

            case .off:
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "OffContentCell",
                    for: indexPath
                )

            case .cafe:
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "CafeContentCell",
                    for: indexPath
                )

            case .fresh:
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: "FreshContentCell",
                    for: indexPath
                )
            }
        }

        // 3 → Coupons
        if indexPath.item == contentIndex + 1 {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "CouponsOffersCell",
                for: indexPath
            )
        }

        // 🔥 4 → Categories (NEW)
        if indexPath.item == contentIndex + 2 {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "CategorySectionCell",
                for: indexPath
            )
        }
        // 🔥 4 → Categories (NEW)
        if indexPath.item == contentIndex + 3 {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "DealsSectionView",
                for: indexPath
            )
        }
        if indexPath.item == contentIndex + 4 {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "BuyAgainProductsCell",
                for: indexPath
            )
        }
        
        if indexPath.item == contentIndex + 5 {
            let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "HomeBannerSectionCell",
                    for: indexPath
                ) as! HomeBannerSectionCell

                return cell
        }
        
        

        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width

        if indexPath.item == 0 {
            return CGSize(width: width, height: 270)
        }

        if !isTabsHidden && indexPath.item == 1 {
            return CGSize(width: width, height: 80)
        }

        let contentIndex = contentStartIndex

        // Main Content
        if indexPath.item == contentIndex {
            return CGSize(width: width, height: 550)
        }

        // 🔥 Coupons
        if indexPath.item == contentIndex + 1 {
            return CGSize(width: width, height: 300)
        }

        
        if indexPath.item == contentIndex + 2 {
            return CGSize(width: width, height: 1350)
        }
        if indexPath.item == contentIndex + 3 {
            return CGSize(width: width, height: 400)
        }

          if indexPath.item == contentIndex + 4 {
            return CGSize(width: width, height: 640)
        }
        if indexPath.item == contentIndex + 5 {   return CGSize(width: collectionView.frame.width, height: 200)}

        
        return CGSize(width: width, height: 0)
    }
}
extension ViewController: HomeHeaderDelegate {

    func didSelectCategory(index: Int) {

        switch index {
        case 0:
            currentType = .zepto
            isTabsHidden = false

        case 1:
            currentType = .off
            isTabsHidden = true

        case 2:
            currentType = .cafe
            isTabsHidden = true

        case 3:
            currentType = .fresh
            isTabsHidden = true

        default:
            break
        }

        Collectionview.reloadData()
    }
}
