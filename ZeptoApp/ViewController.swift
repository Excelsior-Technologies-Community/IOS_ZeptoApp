//
//  ViewController.swift
//  ZeptoApp
//
//  Created by Noman belim on 24/03/26.
//

import UIKit

class ViewController: UIViewController {
  

    
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
    }
}

extension ViewController: UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1   // Only one full header cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "HomeHeaderFullCell",
            for: indexPath
        ) as! HomeHeaderFullCell

        // Optional: Configure data
//        cell.configure()   // we’ll define this below

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 350)
    }
}
