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

        return isTabsHidden ? 1 : 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // Header
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "HomeHeaderFullCell",
                for: indexPath
            ) as! HomeHeaderFullCell

            cell.delegate = self
            return cell
        }

        // Tabs (only when visible)
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TabsCell",
            for: indexPath
        )

        return cell
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

        return CGSize(width: width, height: 180)
    }
}

extension ViewController: HomeHeaderDelegate {

    func didSelectCategory(index: Int) {

        print("Tapped index:", index)

        selectedIndex = index

        if index == 0 {
            
            isTabsHidden = false
        } else {
            
            isTabsHidden = true
        }

        Collectionview.reloadData()
    }
}
