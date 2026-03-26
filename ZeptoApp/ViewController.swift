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

class ViewController: UIViewController {
  

    var zeptoBanners = [
        BannerItem(imageName: "zeptobanner")
    ]

    var offBanners = [
        BannerItem(imageName: "OffB")
    ]

    var freshBanners = [
        BannerItem(imageName: "FreshB")
    ]

    var cafeBanners = [
        BannerItem(imageName: "CafeB")
    ]

    var currentBanners: [BannerItem] = []
    var isTabsHidden = false
    var selectedIndex: Int = 0
    @IBOutlet weak var Collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentBanners = zeptoBanners
        RegisterXibs()
        
    }

    func RegisterXibs(){
        Collectionview.delegate = self
        Collectionview.dataSource = self
        Collectionview.register(UINib(nibName: "BannerCell", bundle: nil),
                                forCellWithReuseIdentifier: "BannerCell")
        Collectionview.register(UINib(nibName: "ZeptoHeaderView", bundle: nil),  forCellWithReuseIdentifier: "ZeptoHeaderView")
        Collectionview.register(UINib(nibName: "HomeTopSectionCell", bundle: nil),  forCellWithReuseIdentifier: "HomeTopSectionCell")
        Collectionview.register(UINib(nibName: "HomeHeaderFullCell", bundle: nil),  forCellWithReuseIdentifier: "HomeHeaderFullCell")
        Collectionview.register(UINib(nibName: "TabsCell", bundle: nil),
                                forCellWithReuseIdentifier: "TabsCell")
    }
}
extension ViewController: UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        // Header + Tabs (optional) + Banners
        if isTabsHidden {
            return 1 + currentBanners.count
        } else {
            return 2 + currentBanners.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // 🔹 0 → Header
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "HomeHeaderFullCell",
                for: indexPath
            ) as! HomeHeaderFullCell

            cell.delegate = self
            return cell
        }

        // 🔹 1 → Tabs (only if visible)
        if !isTabsHidden && indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TabsCell",
                for: indexPath
            ) as! TabsCell
            return cell
        }

        // 🔹 Banner Index Calculation (SAFE)
        let bannerIndex: Int
        if isTabsHidden {
            bannerIndex = indexPath.item - 1
        } else {
            bannerIndex = indexPath.item - 2
        }

        // 🔥 SAFETY CHECK (NO CRASH)
        guard bannerIndex >= 0 && bannerIndex < currentBanners.count else {
            return UICollectionViewCell()
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "BannerCell",
            for: indexPath
        ) as! BannerCell

        let item = currentBanners[bannerIndex]
        cell.imageView.image = UIImage(named: item.imageName)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width

        // 🔹 Header
        if indexPath.item == 0 {
            return CGSize(width: width, height: 270)
        }

        // 🔹 Tabs
        if !isTabsHidden && indexPath.item == 1 {
            return CGSize(width: width, height: 80)
        }

        // 🔹 Banner
        
        return CGSize(width: width, height: width * 0.35)
    }
}

extension ViewController: HomeHeaderDelegate {

    func didSelectCategory(index: Int) {

        selectedIndex = index

        switch index {
        case 0:
            currentBanners = zeptoBanners
        case 1:
            currentBanners = offBanners
        case 2:
            currentBanners = cafeBanners
        case 3:
            currentBanners = freshBanners
        default:
            break
        }

        // 🔥 Reload only banner section
        Collectionview.reloadData()
    }
}
