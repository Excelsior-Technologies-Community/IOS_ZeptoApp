//
//  HomeHeaderFullCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 24/03/26.
//

import UIKit

import UIKit

class HomeHeaderFullCell: UICollectionViewCell {

    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var ThirdView: UIView!
    @IBOutlet weak var tissueUI: UIView!
    @IBOutlet weak var searchUI: UIView!
    
    let tabs = ["All", "Navratri", "Electronics", "Beauty", "Pharmacy"]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionview.delegate = self
        collectionview.dataSource = self
        
        collectionview.register(UINib(nibName: "TabButtonCell", bundle: nil),
                                forCellWithReuseIdentifier: "TabButtonCell")
        
        // Layout settings
        if let layout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}

extension HomeHeaderFullCell: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {

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

        cell.button.setTitle(tabs[indexPath.item], for: .normal)

        return cell
    }

    // Equal width (NO SCROLL)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / CGFloat(tabs.count)
        return CGSize(width: width , height: collectionView.frame.height)
    }
}
