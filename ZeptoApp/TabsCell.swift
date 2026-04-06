//
//  TabsCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 25/03/26.
//

import UIKit

class TabsCell: UICollectionViewCell {

    var selectedTabIndex = 0
    @IBOutlet weak var collectionView: UICollectionView!

    let tabs: [TabItem] = [
        TabItem(title: "All", imageName: "image"),
        TabItem(title: "Sale", imageName: "sales"),
        TabItem(title: "Home", imageName: "home"),
        TabItem(title: "Beauty", imageName: "beauti"),
        TabItem(title: "Dairy", imageName: "dairy")
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.backgroundColor = .clear
           collectionView.backgroundView = nil  
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        self.backgroundColor = .clear
        
            backgroundColor = .clear
            contentView.backgroundColor = .clear
            
            collectionView.backgroundColor = .clear
            collectionView.isOpaque = false
        self.contentView.backgroundColor = .clear
        collectionView.register(UINib(nibName: "TabButtonCell", bundle: nil),
                                forCellWithReuseIdentifier: "TabButtonCell")
    }
}

extension TabsCell: UICollectionViewDelegate,
                    UICollectionViewDataSource,
                    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedTabIndex = indexPath.item
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TabButtonCell",
            for: indexPath
        ) as! TabButtonCell

        let item = tabs[indexPath.item]

        cell.lblview.text = item.title
        cell.imageview.image = UIImage(named: item.imageName)

        return cell
    }

    // Equal width (NO SCROLL)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 80, height: 90) // ✅ increase height
    }
}
